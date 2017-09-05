clear all; clc;

%Amplitud eco
a = 0.6;
%Repetición eco
t = 0.25;
%Cuántos ecos
N = 10;

[x, Fs] = audioread('noti_res.wav');

%Se calcula qué separación en muestras tiene que haber entre ecos
%para que se repitan cada t segundos
R = uint16(t * numel(x) / 8);

%--------------------------------------------
%h(n) = delta(n) + sum((a^k) * delta(n-k*R)) desde k=0 a k=N-1
h_n = zeros(1, numel(x));

h_n(1) = 1;

for k = 1 : N
   h_n(k * R + 1) = a ^ k;    
end

%y = conv(x, h_n);        %Para consumir menos tiempo de procesamiento
%--------------------------------------------
%--------------------------------------------
%Función de transferencia H(z)=B/A

B = zeros(1, numel(x));
A = zeros(1, numel(x));
numel(x)
B(1) = 1;
B(R + 1) = - a ^ N;

A(1) = 1;
A(R + 1) = - a;

%y = filter(B, A, x);
%--------------------------------------------

%y_sound = audioplayer(y, Fs);
%play(y_sound);

figure;

%Gráfica de h(n)
subplot(1,2,1);
stem(h_n);
xlabel('n');
ylabel('h(n)');

%Gráfica de respuesta en frecuencia
w = 0 : Fs / numel(x): 37;
H_w = (1 - (a ^ N).* exp(- j .* w .* double(R) .* N)) ./ (1 - a .* exp(- j .* w .* double(R)));

subplot(1,2,2);
stem(w, abs(H_w));
xlabel('Frecuencia (w)');
ylabel('|H(w)|');

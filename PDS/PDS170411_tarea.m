clc
clear all

% PARTE 1 Truncamiento y aplicación de una función de ventana de la
% respuesta ideal al impulso

% OBTENER h(n)
M=13;
Wc=((3/8)*pi);
% for n = -6:-1;
% y(n+7)=(sin((((3/8)*pi)).*n))/(pi.*n);
% end;
% y(7)=3/8;
% for n = 1:6;
% y(n+7)=(sin((((3/8)*pi)).*n))/(pi.*n);
% end;

for n = -6:6;
    if n==0;
        y(7)= 1-(Wc/pi);
    else
        y(n+7)=-(sin(Wc*n))/(pi*n);
    end
end;
y
figure;
subplot 231;
stem(y);
grid on;
axis([0 14 -0.4 0.7]); % Axis scaling and appearance
xlabel('n','FontName','Courier','FontSize',15);
ylabel('h(n)','FontName','Courier','FontSize',15);
title('h(n) trunc & despl','FontName','Courier','FontSize',15);

% RESPUESTA en FRECUENCIA del FILTRO

% El pastel es 2pi y lo divido entre el número de personas(512)
dw = (2*pi)/511 ;
w = 0 : dw : 2*pi ;
%figure;
subplot 234;
plot(w,abs(fft(y,512)))%aqui se hizo un fft de 512 muestras sino por omision hace el mismo número de muestras de lo que esta muestreando
grid on;
axis([0 2*pi 0 1.2]); % Axis scaling and appearance
xlabel('w','FontName','Courier','FontSize',12.5);
ylabel('|H(w)|','FontName','Courier','FontSize',12.5);
title('|H(w)|','FontName','Courier','FontSize',14.5);
text(pi,0.9,' \leftarrow (\pi)','FontSize',18);
%%%%%%%%%%%%%%%%%%%%%%     h(n)·W(n)    %%%%%%%%%%%%%%%%%%%%%%%%%

for n = -6:6;
    if n==0;      
        y(7)=(1-(Wc/pi))*(0.5-0.5*cos((2*pi*((n+6)+0.5))/M));
    else
        y(n+7)= -((sin(Wc*n))/(pi*n))*(0.5-0.5*cos((2*pi*((n+6)+0.5))/M));
    end
end;
%y
%figure;
subplot 232;
%subplot(1,2,1);
stem(y);
grid on;
axis([0 14 -0.4 0.7]); % Axis scaling and appearance
xlabel('n','FontName','Courier','FontSize',15);
ylabel('h(n).W(n)','FontName','Courier','FontSize',15);
title('h(n)·W(n)','FontName','Courier','FontSize',15);

% FILTRO
%figure;
subplot 235;

%subplot(1,2,2);
plot(w,abs(fft(y,512)));
grid on;
axis([0 2*pi 0 1.2]); % Axis scaling and appearance
xlabel('w','FontName','Courier','FontSize',15);
ylabel('|H(w)|','FontName','Courier','FontSize',15);
title('|H(w)| de h(n) trun, despl, mul','FontName','Courier','FontSize',14.5);
text(pi,0.9,' \leftarrow (\pi)','FontSize',18);
%%%%%%%%%%%%%%%%%%%%%% 
% PARTE 2 Método del muestreo de la respuesta en frecuencia ideal
%%%%%%%%%%%%%%%%%%%%%% 

% dw = (2*pi)/511 ;
% w = 0 : dw : 2*pi ;

w
Wc
Wc2=(13/8)*pi;
Wc2
exStepWc = Wc/dw;
exStepWc
exStepWc2 = Wc2/dw;
exStepWc2
indice_inf=min(find(w>Wc));
indice_inf
indice_sup=max(find(w<Wc2));
indice_sup
p=0*w; % p Es un vector de 512 elementos, todos son magnitud 0
p(indice_inf:indice_sup)=1;% elementos del 97 al 416 son magnitud 1
% figure;plot(w,p);
% grid on;
% axis([0 2*pi -0.5 1.5]);
% xlabel('w','FontName','Courier','FontSize',15);
% ylabel('|H(w)|','FontName','Courier','FontSize',15);
% title('respuesta en frecuencia H(w) FILTRO IDEAL','FontName','Courier','FontSize',15);

% for i = 1:12;
% r(i)=((2*pi)/12)*i;
% end;
% r

for indice = 1:12;
    r(indice) = ((2*pi)/12)*indice ;
    freq(indice) = (80000*r(indice))/(2*pi) ;
end;
r % Con el 0 son las 13 muestras en radianes
freq % Con el 0 son las 13 muestras en frecuencia (fc)

% hn=zeros(1,M);
% n=0:M-1;
% for k=3:9;% dentro del for k son costantes de 3 a 9
%     hn=hn+(1/13)*exp(i*2*pi*n*k/M);
% end;

hn=zeros(1,M);
n=0:M-1;
for k=1:13;% dentro del for k son constantes
    if k>=3 && k<=9 ;   
       hn=hn+(1/13)*exp(i*2*pi*n*k/M);
    end
end;
n
k
%aver=exp(i*2*pi*n*k/M);
%aver % resulta un vector de 13 elementos
hn
% figure;stem(real(hn));
% grid on;
% xlabel('n','FontName','Courier','FontSize',15);
% ylabel('h(n)','FontName','Courier','FontSize',15);
% title('h(n)','FontName','Courier','FontSize',15);

hnTrans = hn';
U = circshift(hnTrans,6);
hnCausal = U';

%figure;
%subplot 121;
subplot 233; %filascolumnaslugar
stem(real(hnCausal));
grid on;
axis([0 14 -0.4 0.7]);
xlabel('n','FontName','Courier','FontSize',15);
ylabel('h(n)','FontName','Courier','FontSize',15);
title('h(n) Muestreo de H(w) ideal','FontName','Courier','FontSize',15);
%text(7,0.4,'Muestreo de H(w) ideal','FontSize',14,'HorizontalAlignment','center');
% F
%subplot 122;
subplot 236;
plot(w,abs(fft(real(hnCausal),512)));
grid on;
axis([0 2*pi 0 1.2]); % Axis scaling and appearance
xlabel('w','FontName','Courier','FontSize',15);
ylabel('|H(w)|','FontName','Courier','FontSize',15);
title('|H(w)| Muestreo H(w) ideal','FontName','Courier','FontSize',14.5);
text(pi,0.9,' \leftarrow (\pi)','FontSize',18);
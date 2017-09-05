A=1;
f=440;
f2=10000;

w=2*pi*f;
w2=2*pi*f2;

dt=1E-5;
t=1:1/44100:44100;%dt:0.002;

f=A*cos(w*t);
Sp=A*cos(w2*t);
f
figure;
subplot(3,1,1);
stem(t,f);
grid on;
title('Moduladora f(t)');

subplot(3,1,2);
plot(t,Sp);
grid on;
title('Portadora Sp(t)');

Smod=f.*Sp; %
Smod
subplot(3,1,3);
plot(t,Smod);%
grid on;
title('Modulada Smod(t)');

figure;
X=fftshift(fft(Smod,501)); %
w=-(1/(2*dt)):(1/(500*dt)):(1/(2*dt)); 
plot(w,abs(X));
grid on;
axis([-20000 20000 0 60]);
%o=audioplayer()

% Señal modulada Smod + señal portadora Sp con amplitud de 0.15
s1=Smod+(Sp*0.15);%
figure;
subplot(8,2,1);
plot(t,s1); title('Smod +  0.15 Sp');
grid on;
%FT
X=fftshift(fft(s1,501)); 
w=-(1/(2*dt)):(1/(500*dt)):(1/(2*dt)); 
subplot(8,2,2);
plot(w,abs(X)); title('FT');
grid on;
axis([-20000 20000 0 110]);

% Señal modulada Smod + la señal portadora Sp con amplitud de 0.35
s2=Smod+(Sp*0.35); %
subplot(8,2,3);
plot(t,s2);title('Smod +  0.35 Sp');
grid on;
%FT
X=fftshift(fft(s2,501)); 
w=-(1/(2*dt)):(1/(500*dt)):(1/(2*dt)); 
subplot(8,2,4);
plot(w,abs(X));
grid on;
axis([-20000 20000 0 110]);

% Señal modulada Smod + la señal portadora Sp con amplitud de 0.70
s3=Smod+(Sp*0.7);%
subplot(8,2,5);
plot(t,s3);title('Smod +  0.70 Sp');
grid on;
%FT
X=fftshift(fft(s3,501)); 
w=-(1/(2*dt)):(1/(500*dt)):(1/(2*dt)); 
subplot(8,2,6);
plot(w,abs(X));
grid on;
axis([-20000 20000 0 110]);

% Señal modulada Smod + la señal portadora Sp con amplitud de 1
s4= Smod +Sp;%
subplot(8,2,7);
plot(t,s4);title('Smod +  1 Sp');
grid on;
%FT
X=fftshift(fft(s4,501)); 
w=-(1/(2*dt)):(1/(500*dt)):(1/(2*dt)); 
subplot(8,2,8);
plot(w,abs(X));
grid on;
axis([-20000 20000 0 110]);


subplot(6,2,9);
plot(t,f);

subplot(6,2,11);
plot(t,Smod);

%punto 4
se1=s1.*Sp; subplot(8,2,9); plot(t,se1); grid on;
%FT
X=fftshift(fft(se1,501)); w=-(1/(2*dt)):(1/(500*dt)):(1/(2*dt)); 
subplot(8,2,10); plot(w,abs(X)); grid on; axis([-20000 20000 0 110]);

se2=s2.*Sp; subplot(8,2,11); plot(t,se2); grid on;
%FT
X=fftshift(fft(se2,501)); w=-(1/(2*dt)):(1/(500*dt)):(1/(2*dt)); 
subplot(8,2,12); plot(w,abs(X)); grid on; axis([-20000 20000 0 110]);

se3=s3.*Sp; subplot(8,2,13); plot(t,se3); grid on;
%FT
X=fftshift(fft(se3,501)); w=-(1/(2*dt)):(1/(500*dt)):(1/(2*dt)); 
subplot(8,2,14); plot(w,abs(X)); grid on; axis([-20000 20000 0 110]);

se4=s4.*Sp; subplot(8,2,15); plot(t,se4); grid on;
%FT
X=fftshift(fft(se4,501)); w=-(1/(2*dt)):(1/(500*dt)):(1/(2*dt)); 
subplot(8,2,16); plot(w,abs(X)); grid on; axis([-20000 20000 0 110]);
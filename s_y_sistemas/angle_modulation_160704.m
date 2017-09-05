fm=1000;
fp=10000;

wm=2*pi*fm;
wp=2*pi*fp;

dt=1E-5;
t=0:dt:0.002;

fdet=cos(wm*t);% moduladora
Sp=cos(wp*t);  % portadora


figure; 
subplot(8,2,1);  plot(t,fdet);  grid on;   title('Moduladora f(t)');
subplot(8,2,2);  plot(t,Sp);  grid on;  title('Portadora Sp(t)');

Smod1=cos(wp*t+0.3*fdet);
Smod2=cos(wp*t+0.5*fdet);
Smod3=cos(wp*t+0.7*fdet);
Smod4=cos(wp*t+    fdet);
Smod5=cos(wp*t+  2*fdet);
Smod6=cos(wp*t+  3*fdet);


subplot(8,2,3);  plot(t,Smod1);  grid on;  title('Modulada Smod(t)');
%FT
X=fftshift(fft(Smod1,501)); w=-(1/(2*dt)):(1/(500*dt)):(1/(2*dt)); 
subplot(8,2,4);  plot(w,abs(X));  grid on;  axis([-20000 20000 0 110]);

subplot(8,2,5);  plot(t,Smod2);  grid on;  title('Modulada Smod(t)');
%FT
X=fftshift(fft(Smod2,501)); w=-(1/(2*dt)):(1/(500*dt)):(1/(2*dt)); 
subplot(8,2,6);  plot(w,abs(X));  grid on;  axis([-20000 20000 0 110]);

subplot(8,2,7);  plot(t,Smod3);  grid on;  title('Modulada Smod(t)');
%FT
X=fftshift(fft(Smod3,501)); w=-(1/(2*dt)):(1/(500*dt)):(1/(2*dt)); 
subplot(8,2,8);  plot(w,abs(X));  grid on;  axis([-20000 20000 0 110]);

subplot(8,2,9);  plot(t,Smod4);  grid on;  title('Modulada Smod(t)');
%FT
X=fftshift(fft(Smod4,501)); w=-(1/(2*dt)):(1/(500*dt)):(1/(2*dt)); 
subplot(8,2,10);  plot(w,abs(X));  grid on;  axis([-20000 20000 0 110]);
%por 1
subplot(8,2,11);  plot(t,Smod5);  grid on;  title('Modulada Smod(t)');
%FT
X=fftshift(fft(Smod5,501)); w=-(1/(2*dt)):(1/(500*dt)):(1/(2*dt)); 
subplot(8,2,12);  plot(w,abs(X));  grid on;  axis([-20000 20000 0 110]);

subplot(8,2,13);  plot(t,Smod6);  grid on;  title('Modulada Smod(t)');
%FT
X=fftshift(fft(Smod6,501)); w=-(1/(2*dt)):(1/(500*dt)):(1/(2*dt)); 
subplot(8,2,14);  plot(w,abs(X));  grid on;  axis([-20000 20000 0 110]);

% c) Calcular y graficar el valor de la frecuencia de la señal modulada en fase en función del
%    tiempo (de acuerdo a la expresión matemática de la modulación).

% Como la señal modulada en fase es Ap*cos[wp*t+kpm*f(t))
% el angulo es ANG(t)=wp*t+kpm*f(t)
% por lo tanto la frecuencia, en funciòn del tiempo es:
% (derivada del àngulo con respecto al tiempo)
% FREC(t)=wp + kpm*f'(t)
% y
%   f(t) = cos(2*pi*1000*t)
%          
%  f'(t) = -2000*pi*sin(2000*pi*t)
%
% entonces                             cos(wp*t+0.3*(-wm)*sin(wm*t)))

wpmt = wp+0.3*(-wm)*sin(wm*t);
subplot(8,2,15);  plot(t,wpmt);  grid on;  title('Modulada Smod(t)');


% 4. Repítanse algunos de los experimentos con los primeros valores de kPM empleando como señal
% moduladora la suma de dos señales cosenoidales de amplitud 1 y de frecuencia 1 KHz y 3 KHz.


fdet_suma = (cos(2*pi*1000)+cos(2*pi*3000));%moduladora

Smod7= cos(wp*t + 0.3*fdet_suma);%la portadora es ese coseno

subplot(8,2,16);  plot(t,Smod7);  grid on;  title('Modulada Smod(t)');


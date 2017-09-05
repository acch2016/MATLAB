fm=(5000/11);
fp=(10000/3);

wm=2*pi*fm;
wp=2*pi*fp;

dt=1E-5;
t=0:dt:0.005;

fdet=-7*sin(wm*t);% moduladora
Sp=-3*sin(wp*t);%portadora


figure; 
subplot(3,1,1); 
plot(t,fdet);  grid on;   title('Moduladora f(t)');

subplot(3,1,2); 
plot(t,Sp);  grid on;   title('Moduladora f(t)');

Smod=fdet.*Sp+Sp;

subplot(3,1,3); 
plot(t,Smod);  grid on;   title('Moduladora f(t)');
 %%
% s1=Smod+(Sp*0.15);%
% figure;
% subplot(8,2,1);
% plot(t,s1);
% grid on;
% %FT
% X=fftshift(fft(s1,501)); 
% w=-(1/(2*dt)):(1/(500*dt)):(1/(2*dt)); 
% subplot(8,2,2);
% plot(w,abs(X));
% grid on;
% axis([-20000 20000 0 110]);
% 
% % Señal modulada Smod + la señal portadora Sp con amplitud de 0.35
% s2=Smod+(Sp*0.35); %
% subplot(8,2,3);
% plot(t,s2);
% grid on;
% %FT
% X=fftshift(fft(s2,501)); 
% w=-(1/(2*dt)):(1/(500*dt)):(1/(2*dt)); 
% subplot(8,2,4);
% plot(w,abs(X));
% grid on;
% axis([-20000 20000 0 110]);
% 
% % Señal modulada Smod + la señal portadora Sp con amplitud de 0.70
% s3=Smod+(Sp*0.7);%
% subplot(8,2,5);
% plot(t,s3);
% grid on;
% %FT
% X=fftshift(fft(s3,501)); 
% w=-(1/(2*dt)):(1/(500*dt)):(1/(2*dt)); 
% subplot(8,2,6);
% plot(w,abs(X));
% grid on;
% axis([-20000 20000 0 110]);
% 
% % Señal modulada Smod + la señal portadora Sp con amplitud de 1
% s4= Smod +Sp;%
% subplot(8,2,7);
% plot(t,s4);
% grid on;
% %FT
% X=fftshift(fft(s4,501)); 
% w=-(1/(2*dt)):(1/(500*dt)):(1/(2*dt)); 
% subplot(8,2,8);
% plot(w,abs(X));
% grid on;
% axis([-20000 20000 0 110]);
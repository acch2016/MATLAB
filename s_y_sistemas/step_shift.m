clc
A=1;
dt=0.05e-3;%resolución

t=0.015:dt:0.025;
%w=2*pi*f;

s=A*(0.016>t);

plot(t,s);
axis([0.015 0.025 -0.3 1.3]);
xlabel('tiempo t');
ylabel('amplitud de p(t)');
title('Señal p(t)');

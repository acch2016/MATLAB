A=1;
dt=0.05e-3;%resolución

t=0:dt:25e-3;
le=length(t)%501
v(1:le);
%pulso=(le/10);%pulso =20.1

y=A*(v>300 & v<321);

plot(x,y);
% plot(le-15e-3,p);
axis([0 501 -0.3 1.3]);
xlabel('tiempo t');
ylabel('amplitud de p(t)');
title('Señal p(t)');

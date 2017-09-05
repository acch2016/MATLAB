

%A=1;
dt=0.05e-3;%resolución

t=0:dt:25e-3;
%le=length(t)%501
p(1:501)=0;
%pulso=(le/10);%pulso =20.1
p(300:321)=1
%p=A*(u>300 & u<321);

plot(t,p);
% plot(le-15e-3,p);
axis([0 501 -0.3 1.3]);
xlabel('tiempo t');
ylabel('amplitud de p(t)');
title('Señal p(t)');

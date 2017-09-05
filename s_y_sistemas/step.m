A=1;
dt=0.05e-3;%resolución
T=25e-3%10ms
t=0:dt:T;
%w=2*pi*f;

s=A*(t<0.001);
plot(t,s);

%axis
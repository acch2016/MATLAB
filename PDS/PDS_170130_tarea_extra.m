
fo=1000;
T=1/fo;
%w=2*pi*fo;
w=35/100; 
%N=100;% ¿jugar con los puntos?
dn=1/44100;%dn=T/N;%resolución
n=0:dn:5;%de 0 a 0.5s con pasos de 1/110

co=cos(w*n+(pi/4));
%plot(n,co);
%axis([0 3*T -1.1 1.1]);
stem(n,co);
%mesh();

% w2=2*pi*3200;
%s=audioplayer(co,44100);
%play(s)
A=1;
f=1000;
T=1/f;
w=2*pi*f;
N=10;%puntos
dt=0.05e-3;
t=0:dt:T;
s=A*sin(w*t);
figure;plot(t,s);%figure para graficar en nueva ventana
%mesh();
stem(s);
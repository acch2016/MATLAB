%%Filtro PasaBanda
clear
clc
% Componentes
R = 3.77E6;%3.77Mohms
L=12E-3;%12mH
C=0.225E-15;%0225fF
%%Función de transferencia
j=sqrt(-1);
f=linspace(1,1E9,1E5);%Vector de frecuencias
W=2.*pi.*f;
ZR=R;
ZL=j.*W.*L;
ZC=1./(j.*W.*C);
H=ZR./(ZR+ZL+ZC);
%%grafica
semilogx(f,20*log(abs(H)))%grafica en dB
xlabel('frecuencia(Hz)')
ylabel('magnitud(dB)')
title('filtro PasaBanda')
xlim([1E6,1000E6])
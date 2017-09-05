%% Filtro Notch
clear
clc
%% Componentes
R = 2120;      %ohms
C = 11.78E-6;  %uF
L = 12E-3;     %mH
%% Funcion de Transferencia
j = sqrt(-1);
f = linspace(1,1E3,1E3); %vector de frecuencias
W = 2.*pi.*f;
ZR = R;
ZL = j.*W.*L;
ZC = 1./(j.*W.*C);
H = ZR./(ZR+1./(1./ZL+1./ZC)); %ZR/(ZR+ZL||ZC)
%% Grafica
semilogx(f,20*log(abs(H)))
xlabel('frecuencia (Hz)')
ylabel('magnitud (dB)')
title('Filtro Notch')
xlim([400,500])
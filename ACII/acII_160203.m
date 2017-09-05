clear %borramos memoria previa
clc %limpiamos pantalla
%definimos los componentes:
R=20;%20ohms
L=10E-3; %10mH
C=100E-6; %100uF
%ÇDefnmos las impedancias:
j=sqrt(-1); %raiz de -1
f= 1E3; %1kHz
W=2*pi*f;
ZR=R;
ZL=j*W*L;
ZC=1/(j*W*C);
%Realizamos las operaciones:
% en serie:
ZeqSer=ZR+ZL+ZC;
%en Paralelo:
ZeqPar=1/(1/ZR+1/ZL+1/ZC);
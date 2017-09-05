clear %Limpiar memoria
clc %limpiar pantalla
%definimos variables:
R=10E3;%10Kohms
C=100E-9;%1uF
L=12E-3;
j=sqrt(-1);%Raíz de -1
f=linspace(1,100E6,1E5);
%La función linspace crea un vector de puntos, en este caso
%se han generado 1000 puntos desde 1Hz hasta 100MHz
%linspace(freq_inicial,freq_final,puntos)
W=2.*pi.*f; %al trabajar con vectores, las operaciones de
            %multiplicación y división deben ir indicadas
            % con un punto: .* ./
ZR = R;
ZC=1./(j.*W.*C);
ZL=j*W*L;
ZLC=1./((1./ZC)+(1./ZL));
Vin=1;
Vout=Vin.*(ZR./(ZR+ZLC));
%Creamos la gráfica:
semilogx(f,abs(Vout))%eje X en escala logaritmica
grid on %cuadricula
title('Respuesta en frecuencia')
xlabel('frecuencia (Hz)')
ylabel('Vout')

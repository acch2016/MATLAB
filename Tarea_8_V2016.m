% Tarea 8. Modulaci�n en Amplitud.


% 1. Generar los siguientes elementos:
%    �	Una variable de tiempo t con un rango de 0 a 2 milisegundos y un paso dt
%       de al menos 1x10-5 segundos. t=0:dt:0.002.
%    �	Una se�al moduladora cosenoidal de frecuencia f=1KHz y amplitud igual a 1.
%    �	Una se�al portadora cosenoidal de frecuencia f=10KHz y amplitud igual a 1.

clear all;
close all;

dt=1*10^(-5);
t=0:dt:0.002;

fm= 1000;
fp= 10000;

Sm=cos(2*pi*fm*t);
Sp=cos(2*pi*fp*t);

% 2. Producir una se�al correspondiente a la multiplicaci�n de la se�al moduladora
%    por la se�al portadora,
%    equivalente a la modulaci�n en amplitud de doble banda lateral sin portadora.

Sdbl_ps=Sm.*Sp;

%    Graficar en un mismo cuadro de imagen las se�ales correspondientes a la moduladora,
%    la portadora y la modulada.

figure;
subplot(3,1,1); plot(t,Sm); title('Se�al Moduladora');ylabel('S_m(t)');xlabel('tiempo, s'); grid ON;
subplot(3,1,2); plot(t,Sp); title('Se�al Portadora');ylabel('S_p(t)');xlabel('tiempo, s'); grid ON;
subplot(3,1,3); plot(t,Sdbl_ps); title('Se�al Modulada');ylabel('S_d_b_l_-_p_s(t)');xlabel('tiempo, s'); grid ON;

%    Medir, a partir de la gr�fica de la se�al modulada, el cambio de fase cuando la
%    amplitud de la se�al moduladora �cruza� por el nivel de 0 de amplitud.

figure;
plot(t,Sdbl_ps,t,Sp,'r'); title('Se�al Modulada');ylabel('S_d_b_l_-_p_s(t)');xlabel('tiempo, s');
axis([min(t) max(t) 1.3*min(Sdbl_ps) 1.2*max(Sdbl_ps)]); grid ON;

%    Calcular y observar la magnitud de la transformada de Fourier de la se�al modulada,
%    mostrando adecuadamente la escala de frecuencia

N=1024;
SDBL_PS=fftshift(abs(fft(Sdbl_ps,N)));
w=-(1/(2*dt)):(1/((N-1)*dt)):(1/(2*dt)); 

figure;
plot(w,SDBL_PS); title('Espectro de Frecuencias de la Modulaci�n'); ylabel('|SDBL-PS(w)|');xlabel('frecuencia, rad/s'); 
axis([min(w) max(w) 0.1*min(SDBL_PS) 1.3*max(SDBL_PS)]); grid ON;

% 3. Producir una nueva se�al modulada a partir de la se�al modulada en amplitud sin portadora
%    del punto anterior a la cual se le adicione una nueva se�al portadora para obtener una modulaci�n
%    en amplitud con portadora transmitida.
%    a)	Realizar la suma de las dos se�ales de acuerdo a los siguientes casos:
%        i.	Se�al modulada m�s la se�al portadora con amplitud de 0.15.

Sdbl_pt1=Sdbl_ps+0.15*Sp;

%       ii.	Se�al modulada m�s la se�al portadora con amplitud de 0.35.

Sdbl_pt2=Sdbl_ps+0.35*Sp;

%      iii.	Se�al modulada m�s la se�al portadora con amplitud de 0.70.

Sdbl_pt3=Sdbl_ps+0.70*Sp;

%       iv.	Se�al modulada m�s la se�al portadora con amplitud de 1.

Sdbl_pt4=Sdbl_ps+1*Sp;

%    b) Para cada uno de los casos anteriores: observar c�mo se modifica la forma de la se�al
%       resultante en el tiempo, as� como la correspondiente magnitud de su Transformada de Fourier.

SDBL_PT1=fftshift(abs(fft(Sdbl_pt1,N)));
SDBL_PT2=fftshift(abs(fft(Sdbl_pt2,N)));
SDBL_PT3=fftshift(abs(fft(Sdbl_pt3,N)));
SDBL_PT4=fftshift(abs(fft(Sdbl_pt4,N)));

figure;
subplot(4,2,1); plot(t,Sdbl_pt1); title('Se�al Modulada con Portadora - Ap=0.15');ylabel('S_d_b_l_-_p_t(t)');xlabel('tiempo, s'); grid ON;
subplot(4,2,3); plot(t,Sdbl_pt2); title('Se�al Modulada con Portadora - Ap=0.35');ylabel('S_d_b_l_-_p_t(t)');xlabel('tiempo, s'); grid ON;
subplot(4,2,5); plot(t,Sdbl_pt3); title('Se�al Modulada con Portadora - Ap=0.70');ylabel('S_d_b_l_-_p_t(t)');xlabel('tiempo, s'); grid ON;
subplot(4,2,7); plot(t,Sdbl_pt4); title('Se�al Modulada con Portadora - Ap=1');ylabel('S_d_b_l_-_p_t(t)');xlabel('tiempo, s'); grid ON;

subplot(4,2,2);plot(w,SDBL_PT1); title('Espectro de Frecuencias de la Modulaci�n');ylabel('|SDBL-PT(w)|');xlabel('frecuencia, rad/s');
axis([min(w) max(w) 0.1*min(SDBL_PT1) 1.3*max(SDBL_PT1)]); grid ON;
subplot(4,2,4);plot(w,SDBL_PT2); title('Espectro de Frecuencias de la Modulaci�n');ylabel('|SDBL-PT(w)|');xlabel('frecuencia, rad/s');
axis([min(w) max(w) 0.1*min(SDBL_PT2) 1.3*max(SDBL_PT2)]); grid ON;
subplot(4,2,6);plot(w,SDBL_PT3); title('Espectro de Frecuencias de la Modulaci�n');ylabel('|SDBL-PT(w)|');xlabel('frecuencia, rad/s');
axis([min(w) max(w) 0.1*min(SDBL_PT3) 1.3*max(SDBL_PT3)]); grid ON;
subplot(4,2,8);plot(w,SDBL_PT4); title('Espectro de Frecuencias de la Modulaci�n');ylabel('|SDBL-PT(w)|');xlabel('frecuencia, rad/s');
axis([min(w) max(w) 0.1*min(SDBL_PT4) 1.3*max(SDBL_PT4)]); grid ON;

% 4. Producir una nueva se�al correspondiente a la multiplicaci�n de cualquiera de las se�ales
%    moduladas producidas en los puntos anteriores por la se�al portadora. Observar la se�al
%    resultante en el dominio del tiempo y en el de la frecuencia (magnitud de su Transformada de Fourier).

Sdem_ps=Sdbl_ps.*Sp;
Sdem_pt=Sdbl_pt4.*Sp;
SDEM_PS=fftshift(abs(fft(Sdem_ps,N)));
SDEM_PT=fftshift(abs(fft(Sdem_pt,N)));

figure;
subplot(2,2,1); plot(t,Sdem_ps); title('Se�al Modulada PS multiplicada por Portadora');ylabel('S_d_e_m_-_p_s(t)');xlabel('tiempo, s'); grid ON;
subplot(2,2,3); plot(t,Sdem_pt); title('Se�al Modulada PT multiplicada por Portadora');ylabel('S_d_e_m_-_p_t(t)');xlabel('tiempo, s'); grid ON;
subplot(2,2,2);plot(w,SDEM_PS); title('Espectro de Frecuencias de la Modulaci�n');ylabel('|SDEM-PS(w)|');xlabel('frecuencia, rad/s');
axis([min(w) max(w) 0.1*min(SDEM_PS) 1.3*max(SDEM_PS)]); grid ON;
subplot(2,2,4);plot(w,SDEM_PT); title('Espectro de Frecuencias de la Modulaci�n');ylabel('|SDEM-PT(w)|');xlabel('frecuencia, rad/s');
axis([min(w) max(w) 0.1*min(SDEM_PT) 1.3*max(SDEM_PT)]); grid ON;



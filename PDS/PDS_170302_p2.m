clear all;

[x,Fs] = audioread('spring_HiFi.wav');

 h1n= [
0.07840464525404556
0.17707825519483075
0.22014353249171387
0.2759015644497544
0.22014353249171387
0.17707825519483075
0.07840464525404556
];
 
h2n=[
-0.08857280384687653
-0.20001387909943527
-0.13289448474069163
0.7755518089951376
-0.13289448474069163
-0.20001387909943527
-0.08857280384687653 
];

 c1=conv(x,h1n);
 c2=conv(x,h2n);
 
%  x_sound=audioplayer(x,Fs);
%  play(x_sound);
% 
%  pause();
%  
%  yc1_sound=audioplayer(c1,Fs);
%  play(yc1_sound);
%  
%  pause();
%  
%  yc2_sound=audioplayer(c2,Fs);
%  play(yc2_sound);

 % 1.3 transformada
 
DFT_X=fft(x);
DFT_H1=fft(h1n,numel(x));
DFT_H2=fft(h2n,numel(x));

M = numel(DFT_X);
dw = 2*pi*Fs/M;
w =0:dw:2*pi*Fs-dw;

figure;
%subplot(3,1,1);
stem(w,abs(DFT_X),'MarkerEdgeColor','none');
xlim([0 2*pi*Fs]);
xlabel('Frecuencia (w)','FontName','Courier','FontSize',14.5);
ylabel('X(w)','FontName','Courier','FontSize',14.5);
title('|X(w)|','FontName','Courier','FontSize',14.5);
%figure;
%subplot(3,1,2);
% stem(w,abs(DFT_H1),'MarkerEdgeColor' ,'none');
% xlim([0 2*pi*Fs]);
% xlabel('Frecuencia (w)','FontName','Courier','FontSize',14.5);
% ylabel('H1(w)','FontName','Courier','FontSize',14.5);
% title('|H1(w)|','FontName','Courier','FontSize',14.5);
% figure;
%subplot(3,1,3);
% stem(w,abs(DFT_H2),'MarkerEdgeColor' ,'none');
% xlim([0 2*pi*Fs]);
% xlabel('Frecuencia (w)','FontName','Courier','FontSize',14.5);
% ylabel('H2(w)','FontName','Courier','FontSize',14.5);
% title('|H2(w)|','FontName','Courier','FontSize',14.5);

%%%%%%%%%%%%%%%%%%%%
Y1=DFT_X.*DFT_H1;
Y2=DFT_X.*DFT_H2;

y1n=ifft(Y1);
y2n=ifft(Y2);

% pause();
%  
% y1n_sound=audioplayer(y1n,Fs);
% play(y1n_sound);
% 
% pause();
%  
% y2n_sound=audioplayer(y2n,Fs);
% play(y2n_sound);
 
 
%I.7. Graficar y comparar la magnitud de las transformadas de Fourier de las señales anteriores.
%Utilizar las escalas de frecuencia correcta, 
%tomando en cuenta la frecuencia de muestreo de la señal de audio.
% 
figure;
%subplot(2,1,1);
stem(w,abs(Y1),'MarkerEdgeColor' ,'none');
xlim([0 2*pi*Fs]);
xlabel('Frecuencia (w)');
ylabel('Y1');
title('|Y1|');
figure;
%subplot(2,1,2);
stem(w,abs(Y2),'MarkerEdgeColor' ,'none');
xlim([0 2*pi*Fs]);
xlabel('Frecuencia (w)');
ylabel('Y2');
title('|Y2|');
%  
clear all;
clc;

[y,Fs] = audioread('noti_res.wav');
Fs
numel(y)/Fs % = 1 segundo
audio=audioplayer(y,Fs);
%play(audio);
numely=numel(y)
% function w=hanningz(n)
% w=.5*(1-cos(2*pi*(0:n-1)'/(n)));
% w=hanningz(2048);
% w

DFT=fft(y);%DFT

dv = 44100/numel(y);
v = 0 : dv : 44100-dv;
figure;
subplot 311;
stem(v,abs(DFT),'MarkerEdgeColor','none');
axis([0 Fs 0 550]);
title('Señal original','FontName','Courier','FontSize',15);
%xlim([-10 Fs]);

f=10000;
%real
w=2*pi*f;
t=1:numel(y);
DT=1/Fs;
t=0:DT:DT*length(y)-DT;
Sp=cos(w*t);
%exp(-i*2*pi*n*k/N) 
y=y';
Smodulated = y.*Sp;
%Smodulated = y *exp(i*( (2*pi)/numel(y) )*400);
   
%figure;
DFTSmod=fft(Smodulated);
%DFTSmod
subplot 312;
stem(v,abs(DFTSmod),'MarkerEdgeColor','none');
axis([0 Fs 0 550]);
title('Señal modulada','FontName','Courier','FontSize',15);
%xlim([0 Fs]);
%pause;
audio2=audioplayer(Smodulated,Fs);
%play(audio2);

length(DFTSmod)
vec = 0:length(DFTSmod);
vec = vec*0;
%vec(1:10000) = DFTSmod(10000:19999);
vec = DFTSmod;
subplot 313;
stem(abs(vec),'MarkerEdgeColor','none');
axis([0 Fs 0 550]);
audio3=audioplayer(vec,Fs);
%play(audio3);

filename = 'Smodulated.wav';
audiowrite(filename,Smodulated,Fs);

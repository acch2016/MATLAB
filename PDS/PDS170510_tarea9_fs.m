clear all;
clc;

[y_ins,Fs_ins] = audioread('Starlight_instru_only_mono_11025.wav');
[y_voc,Fs_voc] = audioread('Starlight_vocals_only_mono_2205.wav');
Fs_ins/44100
Fs_voc/44100
audio=audioplayer(y_ins,Fs_ins);
% play(audio);
% pause;

% A la parte vocal se le subirá la Fs -> se usará Interpolador

%Fs_voc % 22050
% numel(y_voc) % 5326848

ymI_voc = 0:(numel(y_voc)*2)-1;

ymI_voc = ymI_voc*0;

odd = 0;
for m = 1:numel(y_voc) % de 1 a 10653696    
%   modulus = mod(m,2);
%   if modulus == 1 ;
    ymI_voc(m+odd) = y_voc(m); % el nuevo vector ymi se rellenará en los índices impares con los valores de y_voc
%   end
    odd = odd+1 ;
end

% escuchar la señal ymI_voc sin filtrar
audio_ymI_voc = audioplayer(ymI_voc,Fs_voc*2);
%play(audio_ymI_voc);
%pause;
% ver sin filtar
figure('Color','white');
plot(abs(fft(ymI_voc)));
title('y(m)I vocal Sin filtar','FontName','Courier','FontSize',15);
xlim([0 numel(y_voc)*2]);% Set del límite del eje de las ordenadas
% filtro pasabajas
hn_LPF=fir1(6,0.5);
ymI_voc_filtrada=filter(hn_LPF,1,ymI_voc);
% ver filtrada
figure('Color','white');
plot(abs(fft(ymI_voc_filtrada)));
title('y(m)I vocal después del pasabajas','FontName','Courier','FontSize',15);
xlim([0 numel(y_voc)*2]);% Set del límite del eje de las ordenadas
% escuchar filtrada
audio_ymI_voc_f = audioplayer(ymI_voc_filtrada,Fs_voc*2);
%play(audio_ymI_voc_f);
%pause;

% ymI_voc_filtrada ya contiene muestras a 44100

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Interpolador con un factor de 2 de la parte instrumental antes del Diezmador

ymI_ins = 0:(numel(y_ins)*2)-1;
ymI_ins = ymI_ins*0;

odd = 0;
for m = 1:numel(y_ins) % de 1 a 10653696    
    ymI_ins(m+odd) = y_ins(m); % el nuevo vector ymI_ins se rellenará con los valores de y_ins intercalando los espacios
    odd = odd+1 ;
end

% escuchar la señal ymI_ins sin filtrar
audio_ymI_ins = audioplayer(ymI_ins,Fs_ins*2);
%play(audio_ymI_ins);

% filtro pasabajas
hn_LPF=fir1(6,0.5);
ymI_ins_filtrada = filter(hn_LPF,1,ymI_ins);

% ymI_ins_filtrada es la señal que ahora ingresará en el Diezmador

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

% A ymI_ins_filtrada se le tiene que bajar la Fs -> se usa Diezmador

% se reducirá a un quinto de la frecuencia de muestreo 

ymD = 0:(numel(ymI_ins_filtrada)/5)-1; % creo un vector de 1/5 del tamaño de y_ins 
%numel_ymD = numel(ymD)  % 5326848
ymD = ymD*0;

odd_counter = 1;
 for n=1:numel(ymD) % va de 1 a 5326848
     
     ymD(n)= ymI_ins_filtrada(odd_counter);
     
     odd_counter = odd_counter+5;% la 5a muestra de y_ins se guardan en el nuevo vector v_m_d
 end

% pause;
audio_ymD = audioplayer(ymD,44100);
%play(audio_ymD); 

suma=ymD+ymI_voc_filtrada;

audio_suma = audioplayer(suma,44100);
%play(audio_suma);

% mi nombre grabado
[y_acch,Fs_acch] = audioread('acch.wav');
y_acch=y_acch';

% escuchar la suma total
suma(1:length(y_acch))=suma(1:length(y_acch))+y_acch(1:length(y_acch));
audio_suma = audioplayer(suma,44100);
% play(audio_suma);
% audiowrite('alexmuse.wav',suma,44100);

% originalmente para ver si la respuesta en frecuencia se expandía o contraía 
dn=44100/numel(y_ins);
n=0:dn:44100-dn;
%figure;
%subplot 211;
%plot(n,abs(fft(y_ins)));
grid on;
%xlabel('44100','FontName','Courier','FontSize',15);

dn=44100/numel(ymI_ins);
n=0:dn:44100-dn;
%subplot 212;
%plot(n,abs(fft(ymI_ins)));
grid on;
%xlabel('44100','FontName','Courier','FontSize',15);
 



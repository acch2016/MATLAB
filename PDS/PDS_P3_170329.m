clear all;
clc;
%syms alpha 


alpha=0.7;
%45692 noti_res.wav
%46035 spring_HiFi.wav
[y,Fs] = audioread('spring_HiFi.wav');

R = uint16(0.5* numel(y) /16);

n = 1 : numel(y);

b = alpha*(n == R);
b(1)=1;
stem(n, b);
a=1;
  
%fil = filter(b,a,y);
R
% x_sound=audioplayer(fil,Fs);
%play(x_sound);
 
 
% for k=0:(N-1);
%     b(1)=1;
%     
% end;
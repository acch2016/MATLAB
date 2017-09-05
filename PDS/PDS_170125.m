
clc;
[x,Fs] = audioread('Media.wav');

max(x)
min(x)

% x_sound=audioplayer(x,Fs);
% play(x_sound);

%N puede tomar los siguientes valores 1024,512,256,128,64
N=64;

% paso de cuantización -> delta
delta= 2*0.8 / N;

% mustra cuantizada -> n
xq=delta*(round(x/delta));

% result=audioplayer(xq,Fs);
% play(result);

err=(x-xq);
%err
plot(err);
xlabel('TIEMPO DISCRETO (n)');
ylabel('AMPLITUD DISCRETA err(n)');
title('SEÑAL x(n)');

% result2=audioplayer(err,Fs);
% play(result2);

%audiowrite('newfile.wav',xq,Fs);




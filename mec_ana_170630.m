clc
clear all;

syms ax T;
[sT,sax] = solve(T-200*sind(30)-(200/32.2)*ax==0, 350-2*T-(1/2)*(350/32.2)*ax==0);

sax
sT

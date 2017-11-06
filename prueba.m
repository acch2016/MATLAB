clear all;
clc

syms t;

tval = [    0,  0.2,  0.4,  0.6,  0.8,  1, 1.2, 1.4, 1.6, 1.8 ,2];
func = exp(-1.2*t) *(2.027*cos(4.75*t) + 2.561*sin(4.75*t));
double(subs(func,t,tval))

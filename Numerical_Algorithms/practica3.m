clear all;
clc;
%hayt pag 343
tval = [    0,  0.2,  0.4,  0.6,  0.8,     1, 1.2, 1.4, 1.6, 1.8];
yval = [  2.0270 ,   2.5662 ,   1.0941 ,  -0.5866  , -1.2139  , -0.7479 ,   0.0667,    0.5238 ,   0.4381 ,   0.0768 ];

%syms x;
syms t;
a = -1.2;
w0 = 4.75;
%f1 = 1; f2 = x; f3 = x.^2;
%f1 = cos(x); f2 = sin(x); f3 = exp(x);
f1 = (exp(a*t)*cos(w0*t)); f2 = (exp(a*t)*sin(w0*t));

% disp(' Paso 1: Forme la matriz A usando los valores en la tabla de  t ');
%A = [ subs(f1,x,xval)', subs(f2,x,xval)', subs(f3,x,xval)' ];
A = [ subs(f1,t,tval)', subs(f2,t,tval)' ];

% 
% disp(' Paso 2: Forme el vector b usando los valores en la tabla de a = altura = yval ');
b = yval';

% disp(' Paso 3: Se calcula la Transpuesta de A ');
% A'
% 
% disp(' Paso 4: Se calcula el producto de matrices  AT * A');
% A'*A
% 
% disp(' Paso 5: Se calcula la matriz inversa  (AT A)-1? ');
% inv(A'*A)

% disp(' Paso 6: Se calcula el producto de matrices  (AT A)-1 * AT ? ');
% double((inv(A'*A))*A')

c = double((inv(A'*A))*A'*b)

%f = c(1)*f1+c(2)*f2+c(3)*f3

f = c(1)*f1+c(2)*f2

ezplot(f,[tval(1),tval(end)])
hold on
plot(tval,yval,'or')

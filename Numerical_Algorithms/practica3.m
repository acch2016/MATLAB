clear all;
clc;

xval = [   0.5,  1,   1.5,  2,  3 ];
yval = [  11  , 17,  21  , 23, 18 ];

syms x;
%f1 = 1; f2 = x; f3 = x.^2;
f1 = cos(x); f2 = sin(x); f3 = exp(x);

% disp(' Paso 1: Forme la matriz A usando los valores en la tabla de  t ');
A = [ subs(f1,x,xval)', subs(f2,x,xval)', subs(f3,x,xval)' ];
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

f = c(1)*f1+c(2)*f2+c(3)*f3

ezplot(f,[xval(1),xval(end)])
hold on
plot(xval,yval,'or')

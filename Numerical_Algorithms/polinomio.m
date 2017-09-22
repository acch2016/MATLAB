clear all;
clc;

%Input values as a table on a matrix. Column_1 -> x, Column_2 -> y(x)
% table = [ 1, 4;  2, 3.5;  3, 4;  5, 5.6; 7, 6 ]
table = [
-6.0000,0.944138e-03;
-5.0000,0.298500e-02;
-4.0000,0.941277e-02;
-3.0000,0.297451e-01;
-2.0000,0.938511e-01;
-1.0000,0.289450e+00;
0.0000, 0.767736e+00;
1.0000, 0.141492e+01;
2.0000, 0.198151e+01;
3.0000, 0.245183e+01;
4.0000, 0.285669e+01;
5.0000, 0.321632e+01;
6.0000, 0.354269e+01]

 
[r,c] = size(table);
 
matrix = zeros(r,r+1);
 
matrix(1:r,1:2) = table(1:r,1:2);
 
counter = 0;
r2 = r - 1;
counterRow = 0;

for j = 3:r+1
    
    for i = 1:r-1
    counterRow = counterRow + 1;
    matrix(i,j) = ( matrix(i+1,j-1) - matrix(i,j-1) ) / ( matrix(i+1+counter,j-2-counter) - matrix(i,j-2-counter) );
    
    if i == r2 && counterRow == i
        break
    end
    
    end
    counterRow = 0;
    counter = counter + 1;
    r2 = r2 - 1;
end
matrix 
coef = matrix(1,2:r+1)

poli = coef(1);

grado = 1;
syms x;
for i = 1:r-1
    
    grado = grado * (x-matrix(i,1)) ;
    grado
    poli = poli + coef(i+1)*(grado) ;
    %poli
end
format shortEng
simplify(poli)
ezplot(poli,[ matrix(1,1),matrix(r,1) ])
hold on;
plot( matrix(:,1),matrix(:,2),'or' );
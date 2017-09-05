clc
%Input values as a table on a matrix. Column_1 -> x, Column_2 -> y(x)
table = [ 1, 4; 2, 3.5; 3, 4; 5, 5.6 ]

[r,c] = size(table);

matrix = zeros(r,r+1);

matrix(1:r,1:2) = table(1:r,1:2);

%table(1)

for i = 1:r-1
    matrix(i,3) = ( table(i+1,2) - table(i,2) ) / ( table(i+1,1) - table(i,1) );
    matrix(i,4) = ( table(i+1,3) - table(,3) ) / ( table(,) - table(,) )
end

for i = 1:r-2
   
    matrix(i,4) = ( table(i+1,3) - table(,3) ) / ( table(,) - table(,) )
end

matrix

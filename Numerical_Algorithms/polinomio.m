clc
%Input values as a table on a matrix. Column_1 -> x, Column_2 -> y(x)
table = [ 1, 4;  2, 3.5;  3, 4;  5, 5.6; 7, 6 ]
 
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
    matrix
    if i == r2 && counterRow == i
        break
    end
    
    end
    counterRow = 0;
    counter = counter + 1;
    r2 = r2 - 1;
end
 
matrix

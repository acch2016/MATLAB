function[matrix] = practica0(x,y)


matrix= [];   %declara una matriz vacía
counter = 0;
for i = 1:5,     %cuenta el número de renglón actual
    for j = 1:5,      %cuenta el número de columna actual
        counter = counter + 1;
        if mod(counter,2) == 1 
            matrix(i,j) = x;
        else
            matrix(i,j) = y;
        end
    end
end

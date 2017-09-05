
%clear xe;
N=20;
n=0:(N-1); % n es un vector de 20 elementos que van de 0 a 19
x=0*n; % x Es un vector de 20 elementos, todos son magnitud 0
x(1:10)=1; % Los primeros 10 elementos de x ahora tienen magnitud de 1 1


 
for k=0:(N-1); % dentro del for k son costantes de 0 a 19
    xe(:,k+1)=exp(-i*2*pi*n*k/N); % Se calculan las exponenciales complejas y resultan en un vector de 20 magnitudes ya que hubo una multiplicacion por n. Después en cada iteración se asignan a la k-ésima columna de la matriz xe
end;


xe(20)



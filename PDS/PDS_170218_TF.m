
N=100;
n=0:(N-1); % n es un vector de 100 elementos que van de 0 a 99
x=0*n; % x Es un vector de 100 elementos, todos son magnitud 0
x(1:10)=1; % Los primeros 10 elementos de x ahora tienen magnitud de 1
w=2*pi/100;

for ene=0:(N-1);
    xe(:,ene+1)=exp(-i*w*n*ene);
end;

for k=0:(N-1); % dentro del for k son costantes de 0 a 19
    xe(:,k+1)=exp(-i*2*pi*n*k/N);% Se calculan las exponenciales complejas 
                                 % y resultan en un vector de 20 magnitudes
                                 % ya que hubo una multiplicacion por n. 
                                 % Después en cada iteración se asignan a 
                                 % la k-ésima columna de la matriz xe
end;    
for k=1:N; % La iteración será de 1 a 20
    ck(k)=sum(x'.*xe(:,k))/N; % En cada iteración, xe es una columna de 
                              % 20 renglones que se multiplica por la 
                              % transpuesta de x y de hace la suma de los 
                              % elementos del vector. Es decir, se multiplica
                              % la señal x(n) por las exponenciales complejas 
                              % y se hace la sumatoria. Al final despues de 
                              % dividir entre N, se obtienen los
                              % coeficientes ck
end;


k=0:(N-1);
figure;
stem(k,abs(ck));% grafica el valor absoluto de los coeficientes en el periodo N
xlim([0 50]);% el limite del eje x


xlabel('Periodo N=50','FontName','Courier','FontSize',12.5);
ylabel('Amplitud de coeficientes Ck','FontName','Courier','FontSize',12.5);
title('SEF');
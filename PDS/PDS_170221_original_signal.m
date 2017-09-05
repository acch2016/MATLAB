
N=20; 
n=0:(N-1); % n es un vector de 20 elementos que van de 0 a 19
x=0*n; % x Es un vector de 20 elementos, todos son magnitud 0
x(1:10)=1; % Los primeros 10 elementos de x ahora tienen magnitud de 1

for k=0:(N-1); % dentro del for k son costantes de 0 a 19
    xe(:,k+1)=exp(-i*2*pi*n*k/N);% Se calculan las exponenciales complejas 
                                 % y resultan en un vector de 20 magnitudes
                                 % ya que hubo una multiplicacion por n. 
                                 % Después en cada iteración se asignan a 
                                 % la k-ésima columna de la matriz xe
                                 % quedando como 20 vectores de 20
                                 % magnitudes
end; 
xe
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

for k=0:(N-1);
    xen(:,k+1)=exp(i*2*pi*n*k/N);% xen es de 20*20
end;

xen
for k=1:N; 
    xn(k) = sum((ck(k)).*xen(:,k)) ; % ck es un vector de 20 magnitudes (un array)
end;

ck(2)

k=0:(N-1);
figure;
stem(k,abs(xn));% grafica el valor absoluto de los coeficientes en el periodo N % porque el valor absoluto
 
xlim([0 20]);% el limite del eje x

% k=0:(N-1);
% figure;
% stem(k,abs(ck));% grafica el valor absoluto de los coeficientes en el periodo N
% xlim([0 50]);% el limite del eje x
% 
% xlabel('Periodo N=50','FontName','Courier','FontSize',12.5);
% ylabel('Amplitud de coeficientes Ck','FontName','Courier','FontSize',12.5);
% title('SEF');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            a)

% fo=1000;
% T=1/fo;
% w=2*pi*fo;
% 
% N=100;%puntos
% dt=T/N;
% t=0:dt:2*T;
% 
% suma=0;
% B=0;
% 
% for i=1:5 %rango de iteracion
%     
%    if mod(i,2) == 0 
%    A=0;
%    else
%     
%    A = ( 2*(1/(i*pi)) )*( (-1)^((i-1)/2) ); 
%    
%    end
%    
%    s=(B*sin(i*w*t))+(A*cos(i*w*t));
%    suma=s+suma;
%    
% end
% 
% figure;plot(t,suma)
% axis([0 2*  T -1.1 1.1]);
% xlabel('tiempo t');
% ylabel('Amplitud de x(t)');
% title('Señal x(t)');
% 
% se=audioplayer(suma,1/dt);
% play(se)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 9 sumas con subplot 5 renglones (m), 1 columna (n)
% 
% fo=1000;
% T=1/fo;
% w=2*pi*fo;
% N=100;%puntos
% dt=T/N;
% t=0:dt:2*T;
% suma=0;
% B=0;
% i2 = 1;
% figure;
% for i=1:9 %rango de iteracion 
%        if mod(i,2) == 0
%           A=0;
%        else  
%           A = ( 2*(1/(i*pi)) )*( (-1)^((i-1)/2) );     
%        end
%        s=(B*sin(i*w*t))+(A*cos(i*w*t));
%        suma=s+suma; 
%        if i2 < 5 && A~=0
%           subplot(5,1, i2 );plot(t,s);
%           xlabel('tiempo t');
%           ylabel('x(t)');
%           i2 = i2 + 1;
%        end     
% end
% subplot(5,1,5);
% plot(t,suma);
% axis([0 2*T -1.1 1.1]);
% xlabel('tiempo t');
% ylabel('Amplitud de x(t)');
% title('Señal x(t)');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 15 sumas
% 
% fo=1000;
% T=1/fo;
% w=2*pi*fo;
% 
% N=100;%puntos
% dt=T/N;
% t=0:dt:2*T;
% 
% suma=0;
% B=0;
% 
% for i=1:15 %rango de iteracion
%     
%    if mod(i,2) == 0
%        
%    A=0;
% 
%    else
%     
%    A = ( 2*(1/(i*pi)) )*( (-1)^((i-1)/2) );    
%    
%    end
%    
%    s=(B*sin(i*w*t))+(A*cos(i*w*t));
%    suma=s+suma;
%    
% end
% 
% figure;plot(t,suma)
% axis([0 2*T -1.1 1.1]);
% xlabel('tiempo t');
% ylabel('Amplitud de x(t)');
% title('Señal x(t)');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % b)
% 
% fo=1000;
% T=1/fo;
% w=2*pi*fo;
% N=100;%puntos
% dt=T/N;
% t=0:dt:2*T;
% suma=0;
% B=0;
% for i=1:5 %rango de iteracion
%     
%    if mod(i,2) == 0
%        
%    A=0;
% 
%    else
%        
%    A =( 4*( 1/((i^2)*(pi^2)) )*( (1- (-1)^i) )) ;
%    
%    end
%    
%    s=(B*sin(i*w*t))+(A*cos(i*w*t));
%    suma=s+suma;
%    
% end
% 
% figure;plot(t,suma)
% axis([0 2*T -1.1 1.1]);
% xlabel('tiempo t');
% ylabel('Amplitud de x(t)');
% title('Señal x(t)');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% fo=1000;
% T=1/fo;
% w=2*pi*fo;
% 
% N=100;%puntos
% dt=T/N;
% t=0:dt:2*T;
% 
% suma=0;
% B=0;
% 
% for i=1:15 %rango de iteracion
%     
%    if mod(i,2) == 0
%        
%    A=0;
% 
%    else
%     
%    A = ( 2*(1/(i*pi)) )*( (-1)^((i-1)/2) );    
%    
%    end
%    
%    s=(B*sin(i*w*t))+(A*cos(i*w*t));
%    suma=s+suma;
%    
% end
% 
% figure;plot(t,suma)
% axis([0 2*T -1.1 1.1]);
% xlabel('tiempo t');
% ylabel('Amplitud de x(t)');
% title('Señal x(t)');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%b)

fo=1000;
T=1/fo;
w=2*pi*fo;

N=100;%puntos
dt=T/N;
t=0:dt:1;

suma=0;
A=0;

for i=1:10 %rango de iteración
    
   B =( -2*( 1/(i*pi) )*( (-1)^i ) ) ;

   s=(B*sin(i*w*t))+(A*cos(i*w*t));
   suma=s+suma;
   
end

figure;plot(t,suma)
axis([0 2*T -1.1 1.1]);
xlabel('tiempo t');
ylabel('Amplitud de x(t)');
title('Señal x(t)');

se=audioplayer(suma,1/dt);
play(se)
% 
% spectrum

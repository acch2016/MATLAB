
sum=0;
h=[0,0,0,0,0,1,-1,0,1,-1,0,0,0,0,0];
x=[0,0,0,0,0,0, 1,1,0,-1,0,0,0,0,0];
i=1;

for n=6:14 %rango de iteracion
   for k=6:10 
       
    sum=sum+ x(k)*h((n-k)+6); 
  
    
   end
   y(i)=sum;
   i=i+1;
   sum=0;
end
y
stem(y);


% j=[1,-1,0,1,-1];
% w=[0, 1,1,0,-1];
% e=conv(w,j);
% e;
%    0     1     0    -1     0     1    -1    -1     1


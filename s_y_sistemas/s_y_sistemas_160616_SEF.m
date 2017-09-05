clear;						% clear matlab's memory
figure(2); clf;					% open and clear figure 2

To = 2; wo = 2*pi/To;			        % fundamental period and frequency

D0 = 0.5;					% signal offset, 0 frequency term

i = 1;						% vector index to help store Dn and w

for n = -4:-1,					% loop over negative n
   Dn(i) = (1 - exp(-j*n*pi))/(j*2*pi*n);	% Compute & store fourier coef.
   w(i) = n*wo;					% store associated frequency
	i = i + 1;				% increment vector index   
end;

Dn(i) = D0; w(i) = 0;                           % store 0 frequency terms							
i = i + 1;					% increment vector index

for n = 1:4,					% loop over positive n
   Dn(i) = (1 - exp(-j*n*pi))/(j*2*pi*n);	% Compute & store Fourier coef.
   w(i) = n*wo;					% store associated frequency
   i = i + 1;					% increment vector index;
end;
   
subplot(2,1,1);					% plot magnitude spectrum of f(t)
stem(w,abs(Dn),'filled');
xlabel('\omega ');
ylabel('|D_n|');
title('Magnitude Spectrum of f(t) Showing First Four Harmonics');

subplot(2,1,2);					% plot phase spectrum of f(t)
stem(w,angle(Dn),'filled');
xlabel('\omega ');
ylabel('\angle D_n ');
title('Phase Spectrum of f(t) Showing First Four Harmonics');
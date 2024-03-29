function y1=medf(x1,L,N)
% median filtering of sequence x1, of length N samples, with medians of
% length L
%
    x2=[ones(1,(L-1)/2).*x1(1) x1 ones(1,(L-1)/2).*x1(N)];
    y1=[];
    for i=1:N
        y=x2(i:i+(L-1));
        y1=[y1 median(y)];
    end
end
function [ w ] = hanningz( n )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
w=.5*(1-cos(2*pi*(0:n-1)'/(n)));

end

% function w=hanningz(n)
% w=.5*(1-cos(2*pi*(0:n-1)'/(n)));
%clear all;
clc
% A = [1 -1 3.1; 2 0 8]
% A(1,3)
% a = A(1:2,2)
% A(2,1:3) = 2*A(2,1:3) 
% A = A.^2
% 
% B = [ 1.1, 1.2;  2.1, 2.2; 3.1, 3.2 ]
% b = B(2:3,1:2)
% 
% B(1:3,2) = B(1:3,2).^2

% un número x entero positivo:
% x = input('Please input a positive value (x): ');
% if x < 0
%     disp('I told you positive...')
% elseif x > 0 
%     disp(x)
% else
%     disp(' ')
% end

%  x = input('Please input a positive value (x): ');
%  remainder = mod(x,2);
%  if x < 0
%      disp('I told you positive...')
%  elseif x > 0
%      switch remainder
%          case 0
%              disp(x)
%          case 1
%              disp(x*2)
%          otherwise
%              disp(' ')         
%      end
%  else
%      disp(' ')
%  end


% A= ones(4,1);
% A
% for i = 2:5
%     A = [A 2*A(:,i-1)];
%     A
% end


x = input('Please enter a number x: ');
y = input('Please enter a number y: ');
[matrix] = practica0(x,y);
matrix
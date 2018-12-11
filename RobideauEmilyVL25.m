% Author: Emily Robideau
% Collaborators: None
% Assignment: VL25

fh = @(x) exp(x)*(cos(x)+sin(x));
a = 0;
b = 1;

f = 0;
h = (b-a)/N;
for k = 1:N
    x = (k-1)*h + a;
    y = x+h;
    f = f + (feval(fh,x) + feval(fh,y))*(h/2);
end
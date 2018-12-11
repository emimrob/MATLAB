function f = RobideauEmilyMyTrap(fh,N,a,b)
% Author: Emily Robideau
% Collaborators: None
% Assignment: HW10 P1
f = 0;
h = (b-a)/N;
for k = 1:N
    x = (k-1)*h + a;
    y = x + h;
    f = f + (feval(fh,x) + feval(fh,y))*(h/2);
end
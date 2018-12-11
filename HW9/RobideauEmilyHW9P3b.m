% Author: Emily Robideau
% Collaborators: None
% Assignment: HW9P3

% a: M = 1443.53, b: 78.6951


fh = @(L) 150 + 2*(100+L)*(L/100)^2 + (100+L)*(6) - 1443.5;
dfh = @(L) 2*(L/100)^2 + (200+2*L)*(L/5000) + 6;
maxit = 100;
tol = 1.e-9;
it = 0;
u = 2 * tol;
x = 0;

while (it < maxit) && (abs(u-x) > tol)
    it = it + 1;
    u = feval(fh, x);
    du = feval(dfh, x);
    x = x - u / du;
end
disp(x);
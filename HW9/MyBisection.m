function p = MyBisection(fh, a, b, tol)
% Author: Emily Robideau
% Collaborators: None
% Assignment: HW9 P1

u = 2 * tol;
fa = feval(fh, a);
fb = feval(fh, b);

while abs(u) > tol
    p = (a*fb - b*fa) / (fb - fa); % only change
    u = feval(fh,p);
    if (u*fa > 0)
        a = p;
        fa = u;
    else
        b = p;
        fb = u;
    end
end


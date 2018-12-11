function p = RobideauEmilyMyBisection2(fh, a, b, tol)
% Author: Emily Robideau
% Collaborators: None
% Assignment: HW9 P2

u = 2 * tol;
fa = feval(fh, a);
fb = feval(fh, b);

while abs(u-0.0089) > tol
    p = (a*fb - b*fa) / (fb - fa);
    u = feval(fh,p);
    if (u*fa > 0)
        a = p;
        fa = u;
    else
        b = p;
        fb = u;
    end
end
% Author: Emily Robideau
% Collaborators: None
% Assignment: HW9 P4

% part a
%vP = (P*a*vmax/P0)*(((P0 + a)/(P + a)) - 1);

% part b
%dvP = (a*vmax/P0)*(((P0 + a)/(P + a)) - 1) + (P*a*vmax/P0)*((P0 + a)/(P + a));

% part c: -0.7259
% part d:
function p = RobideauEmilyHW9P4(fh, tol, a, b)
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
end
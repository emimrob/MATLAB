function rootApprox = BisSearchRobideauEmilyHW5(c1,c2,tol)
% Author: Emily Robideau
% Assignment: HW5 P5a
% Collaborators: None
a = 0;
b = 1;
while (b - a > tol)
    mid = (b + a)/2;
    f = c1*sin(pi()*(mid)) + c2*cos(pi()*(mid));
    if (f < 0)
        b = mid;
    elseif (f > 0)
        a = mid;
    end
    rootApprox = (b + a)/2;
end
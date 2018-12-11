function rootApprox = BisSearchAnonRobideauEmilyHW5(fh,a,b,tol)
% Author: Emily Robideau
% Assignment: HW5 P5b
% Collaborators: None
while (b - a > tol)
    mid = (b + a)/2;
    f = feval(fh, mid);
    if (f < 0)
        b = mid;
    elseif (f > 0)
        a = mid;
    end
    rootApprox = (b + a)/2;
end
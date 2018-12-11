function  x0 = MyRecBisRobideauEmilyHW5 (fh, a, b,  tol)
% Author: Emily Robideau
% Assignment: HW5 P5c
% Collaborators: None
mid = (b+a)/2;
if (b-a) < tol
    x0 = mid;
else
    if feval(fh, mid) < 0
        x0 = MyRecBisRobideauEmilyHW5 (fh, mid, b, tol);
    else
        x0 = MyRecBisRobideauEmilyHW5 (fh, a, mid, tol);
    end
end
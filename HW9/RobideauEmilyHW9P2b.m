% Author: Emily Robideau
% Collaborators: None
% Assignment: HW9 P2b

function sigma = RobideauEmilyHW9P2b(lambda,stress)
R0 = 3;
H0 = 3;
E = 50;
L0 = sqrt((2*pi*R0)^2 + H0^2);
lambdat = L0/H0;
EH = (E*H0^2)/(L0*(H0 + (L0 - H0)*(1 + (37/(6*(pi^2))) + 2*(L0/pi)^2)));
if lambda < lambdat
    H = lambda*H0;
    R = (sqrt(L0^2 - H^2))/(2*pi);
    Z = (R^2 + H^2)/(L0*H*(1 + 4*(R^2) + ((6*(R^2))/(H^2))*(20/9 + R^2)));
    fh = @(lambda) Z*EH*(lambda - 1)-(0.5*stress);
    sigma = MyBisection(fh, 0, 6, 10^-2);
else
    fh = @(lambda) EH*(lambdat - 1) + E*((lambda/lambdat) - 1) - (0.5*stress);
    sigma = MyBisection(fh, 0, 6, 10^-2);
end
end
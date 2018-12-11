function stress = FreedDoehringRobideauEmily(R0,H0,E,lambda)
L0 = sqrt((2*pi*R0)^2 + H0^2);
lambdat = L0/H0;
EH = (E*H0^2)/(L0*(H0 + (L0 - H0)*(1 + (37/(6*(pi^2))) + 2*(L0/pi)^2)));
if lambda < lambdat
    H = lambda*H0;
    R = (sqrt(L0^2 - H^2))/(2*pi);
    Z = (R^2 + H^2)/(L0*H*(1 + 4*(R^2) + ((6*(R^2))/(H^2))*(20/9 + R^2)));
    stress = Z*EH*(lambda - 1);
else
    stress = EH*(lambdat - 1) + E*((lambda/lambdat) - 1);
end
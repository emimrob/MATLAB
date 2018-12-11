function dYdt = CalcDerivs(~,Y)
    E  = Y(1);
    S  = Y(2);
    ES = Y(3);
    P  = Y(4);
    
    % fill in your kinetic constants here
    k1  = -3333; %?          
    k_1 = k1;             
    k2  = 3000; %?
    vmax = 3;
    km = 0.1;
    
    % place the appropriate equations here
    dEdt  = (k1 + k2)*ES - k1*E*S; % solve for dE/dt using the MM equation . . .
    dSdt  = k1*ES - k1*E*S;
    dESdt = k1*E*S - k1*ES - k2*ES;
    dPdt  = (vmax*S)/(km + S);
    dYdt  = [dEdt dSdt dESdt dPdt]';
end
function [t,S] = HHeq_ode(Time_Range, Input_Current_fxn)
%
% Hodgekin-Huxley Simulator using ode15s
%
% Given a time range and a time dependent input current, this function
% outputs the membrane potential and time dependent parameters governing
% the function of membrane ion channels. The ode15s integrator is used to
% solve the Hodekin-Huxley differential equations. 
%
% Input Arguments:
%       Time_range        - [t_initial,t_final] - Example: [0 100]
%       Input_Current_fxn -   function handle   - Example: @(n) 10.*sin(n)
%
% Output Arguments:
%       t - time 
%       S - [Voltage, m, n, h] - time-dependant variables voltage and three rate constants
%
% Created by Benjamin Brummel 12/1/2015
%            brumm082@umn.edu

% Check input arguments and assign defaults
    if nargin ~= 2 && nargin ~= 0               ; error('Two input arguments expected')                                      ;end
    if nargin == 0                              ; Time_Range = [0 10]; Input_Current_fxn = @(n) 4                            ;end
    if ~isa(Input_Current_fxn,'function_handle'); error('The second argument: Input_Current_fxn, must be a function handle') ;end
    if length(Time_Range) ~= 2                  ; error('The first argument: Time_Range requires an initial and final value');end

%Define initial conditions
    V0 = -65.1801; %(mV)
    M0 = .0283;
    N0 = .2421;
    H0 = .7590;
    InitialConditions=[V0,M0,N0,H0];

%Finds solutions to the system of differential equations
    [t,S]=ode15s(@CalcDerivs,Time_Range,InitialConditions,[],Input_Current_fxn);
end

%Determines the system of differential equations to be solved
function dSdt = CalcDerivs(t, S, Input_Current_fxn)
    V = S(1); 
    m = S(2);
    n = S(3);
    h = S(4);
    
%Defining initial conditions for conductance and potential
    g0Na = 120 ;
    g0K  = 36  ;
    g0L  = .3  ;
    EL   = -49 ;
    Ek   = -83 ;
    ENa  = 65  ;
    
%Each of the following four blocks of code calculates the differential
%equation for the corresponding variable or voltage
    Alpha_h = .07 *     exp(-.05* (V + 60)  );
    Beta_h  =   1 / (1+ exp(-.1 * (V + 30)) );
    Tau_h   =         1 / (Alpha_h + Beta_h) ;
    h_inf   =   Alpha_h / (Alpha_h + Beta_h) ;
    dhdt    = (h_inf-h) / Tau_h              ;    
    
    Alpha_M = -0.1 * (V + 36) / (exp( ( V + 36) * -.1) -1);
    Beta_M  =               4 * (exp( (-V - 60) / 18)    );
    Tau_M   =         1 / (Alpha_M + Beta_M)              ;
    M_inf   =   Alpha_M / (Alpha_M + Beta_M)              ;
    dmdt    = (M_inf-m) / Tau_M                           ;
    
    Alpha_N = -.01 * (V + 50) / (exp( (V + 50) * -.1)  -1);
    Beta_N  =            .125 * (exp( (V + 60) * -.0125) );
    Tau_N   =         1 / (Alpha_N + Beta_N)              ;
    N_inf   =   Alpha_N / (Alpha_N + Beta_N)              ;
    dndt    = (N_inf-n) / Tau_N                           ;
    
    Ik      = g0K  * (V-Ek) * (n.^4)     ;
    INa     = g0Na * (V-ENa)* (m.^3) * h ;
    IL      = g0L  * (V-EL)              ;
    Im      = Input_Current_fxn(t)       ;
    dVdt    = -1 * (Ik + INa + IL - Im)  ; 
    
%Final result is returned in a vector
    dSdt    = [dVdt,dmdt,dndt,dhdt]';
end
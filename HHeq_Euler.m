function [t,S] = HHeq_Euler(Time_Range, Input_Current_fxn)
%
% Hodgekin-Huxley Simulator using Euler Integration
% 
% Given a time range and a time dependent input current, this function
% outputs the membrane potential and time dependent parameters governing
% the function of membrane ion channels. Euler integration is used with a
% 0.01 ms time step. 
%
% Input Arguments:
%       Time_range        - [t_initial,t_final] - Example: [0 100]
%       Input_Current_fxn -   function handle   - Example: @(n) 10.*sin(n)
%
% Output Arguments:
%       t - time 
%       S - [Voltage, m, n, h] - time-dependant variables
%
% Created by Benjamin Brummel 12/1/2015
%            brumm082@umn.edu

%check for appropriate number of input arguments
    if nargin ~= 2 && nargin ~= 0               ; error('Two input arguments expected')                                      ;end
%set default inputs when none are provided    
    if nargin == 0                              ; Time_Range = [0 10]; Input_Current_fxn = @(n) 4                            ;end
%check to see whether Input_Current_fxn is a function
    if ~isa(Input_Current_fxn,'function_handle'); error('The second argument: Input_Current_fxn, must be a function handle') ;end
%check to see whether Time_Range has 2 values
    if length(Time_Range) ~= 2                  ; error('The first argument: Time_Range requires an initial and final value');end

    V0 = -65.1801; %Initial Voltage (mV)
    M0 = .0283; %Initial value for sodium channel activation rate
    N0 = .2421; %Initial value for potassium channel activation rate
    H0 = .7590; %Initial value for sodium channel inactivation rate
    InitialConditions=[V0,M0,N0,H0];

    dt       = .01; %time step
    t        = Time_Range(1): dt :Time_Range(2); %time range
    S(1,:)   = InitialConditions; %setting up y-values
    for n = 1:length(t)-1
%uses the CalcDerivs function to get the derivatives of each of the four
%variables so a system of differential equations can be formed and solved
            dSdt = CalcDerivs( t(n), S(n,:), Input_Current_fxn );
%updates S to equal S + delta S
        S(n+1,:) = S(n,:) + dSdt'*dt;
    end 
end

%calculates derivatives of each of the four differential equations
function dSdt = CalcDerivs(t, S, Input_Current_fxn)
    V = S(1); %initializes the voltage
    m = S(2); %initializes sodium channel activation rate
    n = S(3); %initializes potassium channel activation rate
    h = S(4); %initializes sodium channel inactivation rate
   
%defines initial conductances
    g0Na = 120 ;
    g0K  = 36  ;
    g0L  = .3  ;
%defines initial potentials (mV)
    EL   = -49 ;
    Ek   = -83 ;
    ENa  = 65  ;
    
%this block calculates the time rate of change of the sodium channel
%inactivation
    Alpha_h = .07 *     exp(-.05* (V + 60)  );
    Beta_h  =   1 / (1+ exp(-.1 * (V + 30)) );
    Tau_h   =         1 / (Alpha_h + Beta_h) ;
    h_inf   =   Alpha_h / (Alpha_h + Beta_h) ;
    dhdt    = (h_inf-h) / Tau_h              ;    
    
%this block calculates the time rate of change of the sodium channel
%activation
    Alpha_M = -0.1 * (V + 36) / (exp( ( V + 36) * -.1) -1);
    Beta_M  =               4 * (exp( (-V - 60) / 18)    );
    Tau_M   =         1 / (Alpha_M + Beta_M)              ;
    M_inf   =   Alpha_M / (Alpha_M + Beta_M)              ;
    dmdt    = (M_inf-m) / Tau_M                           ;
    
%this block calculates the time rate of change of the potassium channel
%activation
    Alpha_N = -.01 * (V + 50) / (exp( (V + 50) * -.1)  -1);
    Beta_N  =            .125 * (exp( (V + 60) * -.0125) );
    Tau_N   =         1 / (Alpha_N + Beta_N)              ;
    N_inf   =   Alpha_N / (Alpha_N + Beta_N)              ;
    dndt    = (N_inf-n) / Tau_N                           ;
    
%calculates the time rate of change of the voltage
%Each of these 4 equations calculates the currents of their respective
%variables
    Ik      = g0K  * (V-Ek) * (n.^4)     ;
    INa     = g0Na * (V-ENa)* (m.^3) * h ;
    IL      = g0L  * (V-EL)              ;
    Im      = Input_Current_fxn(t)       ;
%calculates the time rate of change of the voltage (mV) from the above
%values
    dVdt    = -1 * (Ik + INa + IL - Im)  ; 
%compiles differential equations into a vector
    dSdt    = [dVdt,dmdt,dndt,dhdt]';
end
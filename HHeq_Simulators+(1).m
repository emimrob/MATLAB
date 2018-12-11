%1.1 Constant input current

%Plots 3 graphs of voltage versus time at multiple constant input currents
% current = 0
[t,s] = HHeq_ode([0 50],@(n) 0);
figure
plot(t,s(:,1),'linewidth',2)
ylim([-100 60]);
title('Voltage vs Time, Current = 0 nA');
xlabel('Time (ms)');
ylabel('Voltage (mV)');

%current = 3
[t,s] = HHeq_ode([0 50],@(n) 3);
figure
plot(t,s(:,1),'linewidth',2)
ylim([-100 60]);
title('Voltage vs Time, Current = 3 nA');
xlabel('Time (ms)');
ylabel('Voltage (mV)');

%current = 6
[t,s] = HHeq_ode([0 50],@(n) 6);
figure
plot(t,s(:,1),'linewidth',2)
ylim([-100 60]);
title('Voltage vs Time, Current = 6 nA');
xlabel('Time (ms)');
ylabel('Voltage (mV)');
%% 1.2 Variable input current

% Defines a 1x4 cell containing the functions for the input currents
cur = cell(1,4);
cur{1} = @(n) sin(6.*n);
cur{2} = @(n) 6.*n;
cur{3} = @(n) n.^3;
cur{4} = @(n) exp(n);

% plots the voltage vs time graph using each input current function
for i = 1:4
    [t,s] = HHeq_ode([0 50],cur{i});
    figure;
    plot(t,s(:,1),'linewidth',2)
    hold on;
    ylim([-100 60]);
    title('Voltage vs Time');
    xlabel('Time (ms)');
    ylabel('Voltage (mV)');
end


%% 1.3Comparing Integrators

% plots the graphs of voltage vs time using the ODE solver and Euler's
% method on the same graph at input currents of 4.5,4.6,4.7 and 4.8.
for i = 4.5: .1: 4.8
 [t,S] = HHeq_Euler([0 100],@(n) i);
 figure
 plot(t,S(:,1),'r','linewidth',2)
 hold on;
 [t,S] = HHeq_ode([0 100],@(n) i);
 plot(t,S(:,1) ,'linewidth',2)
 hold on;
 title('Euler/ode15s Integrator Comparison');
 ylabel('Voltage (mV)');
 xlabel('Time (ms)');
 legend('Euler', 'ode15s');
end

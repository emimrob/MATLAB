%1.1
[t,s] = HHeq_ode;
figure;
plot(t,s(:,1),'linewidth',3)
title('Voltage vs Time','FontSize',12,'FontWeight','Bold');
xlabel('Time (s)','FontSize',10);
ylabel('Voltage (V)','FontSize',10);
txt1 = '\uparrow Resting Potential';
txt2 = 'Depolarization \rightarrow';
txt3 = '\leftarrow Repolarization';
txt4 = '\downarrow Hyperpolarization';
text(0.1,-68,txt1);
text(0.25,10.1,txt2);
text(4.2,11.37,txt3);
text(6,-70,txt4);
figure;
plot(t,s(:,2:4),'linewidth',3)
title('Ion Gate Parameters vs Time','FontSize',12,'FontWeight','Bold');
xlabel('Time (s)','FontSize',10,'FontWeight','Bold');
ylabel('Ion Gate Parameters','FontSize',10,'FontWeight','Bold');
legend({'m','n','h'},'Location','northeast');

%1.2 is the commenting of the two scripts

%2.1
for i = 0:0.5:5
    [t,S] = HHeq_ode([0 50],@(n) i);
    figure;
    plot(t,S(:,1),'linewidth',2);
    title('Action Potential','FontSize',12,'FontWeight','Bold');
    xlabel('Time (ms)');
    ylabel('Voltage (mV)');
end

%2.2
input_currents = cell(1,4);
input_currents{1} = @(n) 8.*sin(2.*pi.*(1/25).*n);
input_currents{2} = @(n) 5.*n;
input_currents{3} = @(n) n.^2;
input_currents{4} = @(n) n.^(1/4)+2.*n;
for i = 1:length(input_currents)
    [t,S] = HHeq_ode([0 100],input_currents{i});
    figure;
    plot(t,S(:,1),'linewidth',2);
    title('Action Potential of Input Function');
    xlabel('Time (ms)');
    ylabel('Voltage (mV)');
end

%2.3
for i = 4.5: .1: 4.8
    [t,S] = HHeq_Euler([0 100],@(n) i);
    figure;
    hold on;
    plot(t,S(:,1),'linewidth',2);
    [t,S] = HHeq_ode([0 100],@(n) i);
    plot(t,S(:,1) ,'linewidth',2);
    title('Hodgkin-Huxley Model Comparison');
    xlabel('Time (ms)');
    ylabel('Voltage (mV)');
    legend({'Euler Integration Curve','ode15s Curve'},'Location','northeast');
end
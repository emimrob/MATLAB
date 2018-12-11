
for i=0:.5:5
[t,S] = HHeq_ode([0 50], @(n) i);
figure
plot(t,S(:,1),'linewidth',2);
end
%This for loop graphs several HHeq_ode graphs using constant current
%inputs

input_currents=cell(1:4);
input_currents{1}= @(n) 5.*sin(pi*(1/15).*n);
input_currents{2}= @(n) 8.*n;
input_currents{3}= @(n) 2.*n.^2;
input_currents{4}= @(n) 6.*exp(n);
%These are current inputs equations

for i=1:length(input_currents)
[t,S] = HHeq_ode([0 100], input_currents{i});
figure
plot(t,S(:,1),'linewidth',2);
end
%This for loop graphs several HHeq_ode graphs using the above functions as
%the current inputs

for i = 4.5: .1: 4.8
 [t,S] = HHeq_Euler([0 100],@(n) i);
 figure
 hold on
 plot(t,S(:,1),'linewidth',2)
 [t,S] = HHeq_ode([0 100],@(n) i);
 plot(t,S(:,1) ,'linewidth',2)
 xlabel('Time (ms)');
 ylabel('Voltage (mV)')
 legend('HHeq_ Euler','HHeq_ ode');
end
%This for loop compares the Euler and ode equations by plotting both with
%the same current inputs on a single graph


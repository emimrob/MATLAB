%Computer Assignment 2
%Question 1 
%Name: Michelle Uchenik

%part 1
%Modeling Michaelis-Menten kinetics	for	alcohol	dehydrogenase

%import data
data1 = load('data_1.mat');
data1 = data1.data;

times = 1000*data1(:,1);%convert to ms for clarity
s0 = [0.05 0.2 0.3 04 0.5 0.7 1 2 3 5 10 100]';
% Assume [S] remains constant

N = length(s0);

f1 = figure;
for i=1:N
    pt = data1(:,i);
    plot(times,pt);
    hold on;
end

L1 = "[S]0 = 0.05 mM";
L2 = "[S]0 = 0.2 mM";
L3 = "[S]0 = 0.3 mM";
L4 = "[S]0 = 0.4 mM";
L5 = "[S]0 = 0.5 mM";
L6 = "[S]0 = 0.7 mM";
L7 = "[S]0 = 1 mM";
L8 = "[S]0 = 2 mM";
L9 = "[S]0 = 3 mM";
L10 = "[S]0 = 5 mM";
L11 = "[S]0 = 10 mM";
L12 = "[S]0 = 100 mM";

legend({L1, L2, L3, L4, L5, L6, L7, L8, L9, L10, L11, L12},'Location','northwest');
title('Product formation vs. substrate concentration','FontSize',13,'FontWeight','bold');
xlabel('Time (ms)','FontSize',11,'FontWeight','bold');
ylabel('[P] (mM)','FontSize',11,'FontWeight','bold');

%part 2
f2 = figure;
dp_dt = zeros(N,1);
for i=1:N
    pt = data1(:,i);
    mb = polyfit(times,pt,1);
    dp_dt(i) = mb(1);
end

%plot(s0,dp_dt);
%hold on;
scatter(s0,dp_dt,'filled');
hold on;

title('Michaelis-Menten Curve','FontSize',13,'FontWeight','bold');
xlabel('[S]0 (mM)','FontSize',11,'FontWeight','bold');
ylabel('d[P]/dt (M/s)','FontSize',11,'FontWeight','bold');

%part 3
[vmax,vmax_i] = max(dp_dt);
s0_max = s0(vmax_i);
half_vmax = vmax/2;

%loop to verify the value for km
bestfit = [];
for x = 1:N
   bestfit(x) = abs(dp_dt(x) - half_vmax);
end
[close_v,close_i]=min(bestfit); %find the value and index of s0 that led
%to the value of v closest to vmax/2
bestfit(close_i) = 100000*close_v;
[sec_v,sec_i]=min(bestfit);
%find the next closest point
x1 = s0(close_i);
x2 = s0(sec_i);
y1 = dp_dt(close_i);
y2 = dp_dt(sec_i);

%use a linear approximation to calculate km
m = (y2-y1)/(x2-x1);
b = y1 - (m*x1);
km = (half_vmax - b)/m;

xmax = linspace(0,100);
ymax = vmax; %plot the asymptote
line(xmax,ymax);
hold on;
text(s0_max,vmax,'Vmax, asymptote')
hold on;
plot(km,half_vmax,'r*'); %mark km
hold on;
text(km,half_vmax,'(Km, Vmax/2)')
hold on;

%part 4

%we know that vmax = k2*[E]0, because v = dp/dt = k2[ES] and this 
%term's maximum occurs when all of [E] is in the form of [ES]

E0 = 0.001; %mM
%Vmax is in M/s
k2 = vmax / E0; %1/ms

%part 5

%Km = (K-1+K2)/K1, Can solve for K1 if K1  = K-1

k1 = k2/(km-1);

%adjust for units (this is a guess to make k1 nonzero)
%k1 = k2/(km-(1/1000));

%another potential option:
%k1 = k2/((km*1000)-1);

%graph the curve to see how it fits with the points
f3 = figure;

%scatter(s0,dp_dt,'filled');
%hold on;


%part 6


S0  = 0.3;
ES0 = 0;
P0  = 0;
%t_end = 100;% end time to evaluate over
t_end = 1;
t1 = [0 t_end]; % time range for the ODE solver
IC  = [ E0 S0 ES0 P0 ]; % initial conditions to input into ODE solver
[T,Y] =ode15s(@CalcDerivs,t1,IC);


S1 = "[S]0 = 0.05 mM";
S2 = "[S]0 = 0.2 mM";
S3 = "[S]0 = 0.3 mM";
S4 = "[S]0 = 0.4 mM";

plot(T,Y);

legend({S1, S2, S3, S4},'Location','northwest');
title('Solution curves for oxidation of	Ethanol to acetaldehyde');
xlabel('Time'), ylabel('Concentration');
%hold on;
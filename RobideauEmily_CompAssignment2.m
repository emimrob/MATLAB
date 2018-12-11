%Author: Emily Robideau
%Collaborator: Michelle Uchenik

%Q1
load('data_1.mat');
figure;
plot(data,'DisplayName','data')
xlim([0 10]);
ylim([0 0.03]);
title('Product formation vs substrate concentration');
xlabel('Time (ms)');
ylabel('[P] (M)');
legend({'[S]0 = 0.05 mM','[S]0 = 0.2 mM','[S]0 = 0.3 mM',...
    '[S]0 = 0.4 mM','[S]0 = 0.5 mM','[S]0 = 0.7 mM',...
    '[S]0 = 1 mM','[S]0 = 2 mM','[S]0 = 3 mM','[S]0 = 5 mM',...
    '[S]0 = 10 mM','[S]0 = 100 mM'},'Location','northwest')

%Q2
coeffs = zeros(12,2);
for i = 1:12
    coeffs(i,:) = polyfit(data(:,1),data(:,i),1);
end
data1slope = zeros(12,2);
conc = [0.05; 0.2; 0.3; 0.4; 0.5; 0.7; 1; 2; 3; 5; 10; 100];
data1slope(:,1) = conc;
data1slope(:,2) = coeffs(:,1);
figure;
scatter(data1slope(:,1),data1slope(:,2))
xlim([0 100]);
ylim([0 3]);
title('Rate vs concentration');
ylabel('d[P]/dt (M/s)');
xlabel('[S]0 (mM)');

%Q3
%vmax = 0.03 and
%Km = x-value where y = vmax/2 = 0.015 => Km = 0.01
%dPdt = (vmax * [S])/(Km + [S]);

%Q4
% k2 = vmax/[E]0 = 0.03/0.001 = 30
% in MM equation, vmax = k2*[E]0

%Q5
%Km = (k-1 + k2)/k1  => k-1=k1=k2/(Km - 1) = 30/(-0.9) = -33.3 M
vmax = 0.03; km = 0.01; k2 = 30; k1 = -33.3;

%Q6
y = [0.001 0.3 0 0];
[T Y] = ode15s(@CalcDerivs,[0 100],y);

%Q7
figure;
plot(T,Y);
legend({'[S]0 = 0.05 mM','[S]0 = 0.2 mM','[S]0 = 0.3 mM',...
    '[S]0 = 0.4 mM'},'Location','northwest')
title('Solution curves for oxidation of ethanol to acetaldehyde');
xlabel('Time');
ylabel('Concentration');
hold on;

%Q8
load('data_2.mat');
figure;
plot(data,'DisplayName','data')
xlim([0 11]);
ylim([0 0.5]);
title('Product formation vs substrate concentration');
xlabel('Time (ms)');
ylabel('[P] (M)');
legend({'[S]0 = 0.05 mM','[S]0 = 0.2 mM','[S]0 = 0.3 mM',...
    '[S]0 = 0.4 mM','[S]0 = 0.5 mM','[S]0 = 0.7 mM',...
    '[S]0 = 1 mM','[S]0 = 2 mM','[S]0 = 3 mM','[S]0 = 5 mM',...
    '[S]0 = 10 mM','[S]0 = 100 mM'},'Location','northwest')

coeffs = zeros(12,2);
for i = 1:12
    coeffs(i,:) = polyfit(data(:,1),data(:,i),1);
end
data1slope = zeros(12,2);
conc = [0.05; 0.2; 0.3; 0.4; 0.5; 0.7; 1; 2; 3; 5; 10; 100];
data1slope(:,1) = conc;
data1slope(:,2) = coeffs(:,1);
figure;
scatter(data1slope(:,1),data1slope(:,2))
title('Rate vs concentration');
ylabel('d[P]/dt (M/s)');
xlabel('[S]0 (mM)');

%vmax = 45 and
%Km = x-value where y = vmax/2 = 22.5 => Km = 2.366
%dPdt = (vmax * [S])/(Km + [S]);

% k2 = vmax/[E]0 = 45/0.001 = 45000
% in MM equation, vmax = k2*[E]0

%Km = (k-1 + k2)/k1  => k-1=k1=k2/(Km - 1) = 45000/(-0.9) = 50000
%I know the k2 and km values are wrong. There's probably an issue with
%units somewhere
vmax = 45; km = 2.366; k2 = 45000; k1 = 50000;

y = [0.001 0.3 0 0];
[T Y] = ode15s(@CalcDerivs,[0 100],y);

figure;
plot(T,Y);
legend({'[S]0 = 0.05 mM','[S]0 = 0.2 mM','[S]0 = 0.3 mM',...
    '[S]0 = 0.4 mM'},'Location','northwest')
title('Solution curves for oxidation of ethanol to acetaldehyde');
xlabel('Time');
ylabel('Concentration');
hold on;

%Q9


%Q10
load('data_3.mat');
N = 12; M = 8;
inversedata = zeros(N,M);
for i = 1:N
    for j = 1:M
        inversedata(i,j) = 1/data(i,j);
    end
end
figure;
plot(inversedata(:,1),inversedata(:,2:8))
title('Lineweaver-Burke Plot');
xlabel('1/[S]');
ylabel('1/v');

%Q11
coeffs2 = zeros(length(M),3);
for i = 1:M
    coeffs2(i,1:2) = polyfit(data(:,1),data(:,i),1);
    %column 1 is slope, column 2 is y-intercept
    coeffs2(i,3) = -coeffs2(i,2)/coeffs2(i,1);
    %column 3 is x-intercept
end

%Q12
%competitive - competitive plots tend to look fairly linear,
%noncompetitive plots plateau

%Q13
%v = (vmax*s)/(km(1+(i/ki))+s);

%Q14
%Km = x-value where y = vmax/2 = 22.5 => Km = 2.366
%dPdt = (vmax * [S])/(Km + [S]);
% k2 = vmax/[E]0 = 45/0.001 = 45000
% in MM equation, vmax = k2*[E]0
%Km = (k-1 + k2)/k1  => k-1=k1=k2/(Km - 1) = 45000/(-0.9) = 50000
%These are probably wrong

%Q16
load('data_4.mat');
figure;
plot(data(:,1),data(:,2));
title('Langmuir Binding Isotherm Plot');
xlabel('[O2]eq (mM)');
ylabel('[Myoglobin(O2)compex]eq');
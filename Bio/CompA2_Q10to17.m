%Computer Assignment 2, Due Nov 26 2018

%Name: Michelle Uchenik

%part 2: MM Kinetics with Inhibition

%problem 10
%import data
deabdata = load('data_3.mat');
deabdata = deabdata.data;

newmat = zeros(size(deabdata));

deab = [0 .005 .05 1 5 10 20]';
N = length(deab);
s0 = deabdata(:,1);
s_in = zeros(length(s0),1);

f1 = figure;

for k=1:(length(s0))
    s_in(k) = (1/(s0(k)));
end
newmat(:,1) = s_in;

for i=2:(N+1) %first col contains s0 data
    v = deabdata(:,i);
    v_in = zeros(length(s0),1);
    for j = 1:(length(s0))
        v_in(j) = 1/(v(j));
    end
    newmat(:,i) = v_in;
    plot(s_in,v_in);
    hold on;
end

L1 = "[DEAB] = 0 mM";
L2 = "[DEAB] = 0.005 mM";
L3 = "[DEAB] = 0.05 mM";
L4 = "[DEAB] = 1 mM";
L5 = "[DEAB] = 5 mM";
L6 = "[DEAB] = 10 mM";
L7 = "[DEAB] = 20 mM";

legend({L1, L2, L3, L4, L5, L6, L7},'Location','northwest');
title('Product formation vs. substrate concentration','FontSize',13,'FontWeight','bold');
xlabel('1/[S]','FontSize',11,'FontWeight','bold');
ylabel('1/v','FontSize',11,'FontWeight','bold');

%problem 11
linear_fit = zeros(3,N);
f3 = figure;
for i=2:(N+1)
    vin = newmat(:,i);
    p = polyfit(s_in,vin,1);
    linear_fit(1,i) = p(1); %slope,m
    linear_fit(2,i) = (-1)*p(2)/p(1);%x-int, -b/m
    linear_fit(3,i) = p(2);%y-int,b
    tx = -5:20;
    ty = (linear_fit(1,i))*tx+(linear_fit(3,i)); %y=mx+b
    plot(tx,ty); %plot linear fits to increase neatness of plot
    hold on;
    xlswrite('linearfitdata.xlsx',linear_fit); %export data
end

legend({L1, L2, L3, L4, L5, L6, L7},'Location','northwest');
title('Linear Fit of Product formation vs. substrate concentration','FontSize',13,'FontWeight','bold');
xlabel('1/[S]','FontSize',11,'FontWeight','bold');
ylabel('1/v','FontSize',11,'FontWeight','bold');

%problem 12

%visually, the y intercepts look to intersect near the same place on the y
%axis, which is at a positive x value and thus suggests competitive
%inhibition. This can also be verified:
yints = linear_fit(3,:);
yint_m = mean(yints);
yint_std = std(yints);
%disp(['The y intercepts have a mean of ' num2str(yint_m) ' with a standard deviation of ' num2str(yint_std)]);

% this verifies that the y intercept of each of the linear fits is positive
% and that each of the y intercepts are relatively close together,
% confirming that the given data fits the model of competitive inhibition


%problem 14
%easiest to use the xint and the value of km to calculate ki
ki_vals = zeros(1,7);
for i=2:8
    conc_i = deab(i-1); %concentration of inhibitor
    xin = linear_fit(2,i);
    %solve for ki in terms of other known values
    temp = ((-1)/(xin*km))-1;
    ki_vals(i-1)= conc_i/temp;
end
ki = mean(ki_vals);


%problem 15

%I think this can maybe be calculated by solving for the value of [i] at
%which dp/dt=v is 0.5.

ivals=zeros(1,12);
fh = @(i) (vmax*s0)/(km*(1+(i/ki))+s0);

for n=1:12 %12 different values of s0
    s0 = deabdata(n,1);
    ivals(n) = fzero(fh,3);
end

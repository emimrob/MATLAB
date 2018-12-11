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
scatter(data1slope(:,1),data1slope(:,2))
xlim([0 100]);
ylim([0 3]);
title('Rate vs concentration');
ylabel('d[P]/dt (M/s)');
xlabel('[S]0 (mM)');
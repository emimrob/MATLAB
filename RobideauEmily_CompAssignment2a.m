%P1 Q1
figure;
plot(data,'DisplayName','data')

%P1 Q2
coeffs = zeros(12,2);
for i = 1:12
    coeffs(i,:) = polyfit(data(:,1),data(:,i),1);
end

data1slope = zeros(12,2);
conc = [0.05; 0.2; 0.3; 0.4; 0.5; 0.7; 1; 2; 3; 5; 10; 100];
data1slope(:,1) = conc;
data1slope(:,2) = coeffs(:,1);
figure;
plot(data1slope)
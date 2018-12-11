% Emily Robideau, 9-30-18
Birds = dlmread('Birds.txt','\t');
d = zeros((length(Birds)),1);
REarth = 6371;
for i = 1:(length(Birds)-1)
    d(i:(length(Birds)),1) = REarth * atan((sqrt((cosd(Birds((i+1),6))*sind(Birds((i+1),7)-Birds(i,7)))^2 + (cosd(Birds(i,6))*sind(Birds(i+1,6)) - sind(Birds(i,6))*cosd(Birds(i+1,6))*cosd(Birds(i+1,7)-Birds(i,7)))^2)) / ((sind(Birds(i,6))*sind(Birds(i+1,6))) + (cosd(Birds(i,6))*cosd(Birds(i+1,6))*cosd(Birds(i+1,6)-Birds(i,6)))));
end
D = sum(d);
hpy = 8760;
hpm = 720;
time = zeros(length(Birds),1);
dt = zeros((length(Birds)-1),1);
for t = 1:length(Birds)
    time(t) = hpy.*Birds(t,1) + hpm.*Birds(t,2) + 24.*Birds(t,3) + Birds(t,4) + (1/60).*Birds(t,5);
    if t > 1
        dt(t-1) = time(t) - time(t-1);
    end
end
T = sum(dt);
AveSpeed = D/T;
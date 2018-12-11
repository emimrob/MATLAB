% Emily Robideau, 9-28-18
BP = dlmread('BP.txt');
BPsmooth = zeros((length(BP)-10),1);
for i = 6:(length(BP)-5)
    BPsmooth(i,1) = mean(BP((i-5):(i+5),2));
end
v = zeros(1);
k=1;
for j = 2:(length(BP)-1)
    if (BP((j-1),2) < BP(j,2)) && (BP((j+1),2) < BP(j,2))
        v(k) = BP(j,1);
        k=k+1;
    end
end
w = zeros(1,10);
for m = 1:(length(v)-1)
    w(m) = w(m+1) - w(m);
end
PulseRate = mean(w);
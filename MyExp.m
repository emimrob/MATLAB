% Emily Robideau, 10-1-18
function e = MyExp(x)
e = 1;
k = 0;
de = 1;
while (de > 1e-6)
    k = k + 1;
    de = (x^k)/factorial(k);
    e = e + de;
end

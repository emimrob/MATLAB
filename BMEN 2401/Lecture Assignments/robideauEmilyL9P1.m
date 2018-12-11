function e = MyExp(x)
e = 1;
k = 0;
de = 1;
while (de > 1e-6)
    k = k + 1;
    e = e + ((x^k)/(factorial(k)));
end

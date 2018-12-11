% Emily Robideau, 10-1-18
function d = MyB2D(v)
N = length(v);
d = 0;
for k = 1:N
    d = d + v(k)*2^(N-k);
end
function s = MySelectionSort(v)

N = length(v);

for i = 1:(N-1)
    m = v(i);
    k = i;
    for j = i+1:N
        if v(j) < m
            k = j;
            m = v(j);
        end
    end
    v(k) = v(i);
    v(i) = m;
end

s = v;
function v2 = RobideauEmilyMyMultiBubbleSort(v)
N = length(v);
c = 1;
ns = floor(log(sqrt(N))/log(2))+1;
while (c > 0)
    c = 0;
    for i = (ns-1):-1:0
        for j = 1:2^i
            for k = j:2^i:(N-2^i)
                if (v(k) > v(k+2^i))
                    temp = v(k);
                    v(k) = v(k+2^i);
                    v(k+2^i) = temp;
                    c = 1;
                end
            end
        end
    end
end
v2 = v;
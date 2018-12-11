function v2 = RobideauEmilyMyDoubleBubbleSort(v)

N = length(v);

c = 1;

while (c > 0)
    c = 0;
    for i = 2:2:(N-2)
        if (v(i) > v(i+2))
            temp = v(i);
            v(i) = v(i+2);
            v(i+2) = temp;
            c = 1;
        end
    end
    for j = 1:2:(N-2)
        if (v(j) > v(j+2))
            temp = v(j);
            v(j) = v(j+2);
            v(j+2) = temp;
            c = 1;
        end
    end
    for k = 1:(N-1)
        if (v(k) > v(k+1))
            temp = v(k);
            v(k) = v(k+1);
            v(k+1) = temp;
            c = 1;
        end
    end
end

v2 = v;
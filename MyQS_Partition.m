function [p,i] = MyQS_Partition(v, i0, i1)

p = v;
pivot = v(i1);

i = i0;

for j = i0:(i1-1)
    if (v(j) < pivot)
        if (i ~= j)
            temp = v(i);
            v(i) = v(j);
            v(j) = temp;
        end
        i = i + 1;
    end
end

temp = v(i);
v(i) = v(i1);
v(i1) = temp;

p = v;

end


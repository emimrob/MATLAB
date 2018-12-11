function s = MyBubbleSort(v)

N = length(v);

c = 1; % Flag for a switch this sweep

while (c > 0)
    c = 0;
    for i = 1:(N-1)
        if (v(i) > v(i+1))
            temp = v(i);
            v(i) = v(i+1);
            v(i+1) = temp;
            c = 1;
        end
    end
end

s = v;
         
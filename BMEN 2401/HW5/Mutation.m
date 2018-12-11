% Emily Robideau, 10-4-18
function [n, c] = Mutation(str1,str2)
n = 0;
c = '*';
k = 0;
if length(str1) == length(str2)
    for i = 1:length(str1)
        if (k == 0) && (str1(i) ~= str2(i))
            n = i;
            c = str2(i);
            k = 1;
        end
    end
elseif length(str2) < length(str1)
    for j = 1:length(str2)
        if (k == 0) && (str1(j) ~= str2(j))
            n = j;
            c = '-';
            k = 1;
        end
    end
elseif length(str2) > length(str1)
    for m = 1:length(str2)
        if (k == 0) && (str1(m) ~= str2(m))
            n = m-1;
            c = str2(m);
            k = 1;
        else
            n = 
        end
    end
end
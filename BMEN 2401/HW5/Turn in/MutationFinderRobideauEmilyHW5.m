function [mutIndex, mutType] = MutationFinderRobideauEmilyHW5(s1,s2)
% Author: Emily Robideau
% Assignment: HW5 P4
% Collaborators: None
mutIndex = 0;
mutType = '*';
k = 0;
if length(s1) == length(s2)
    for i = 1:length(s1)
        if (k == 0) && (s1(i) ~= s2(i))
            mutIndex = i;
            mutType = s2(i);
            k = 1;
        end
    end
elseif length(s2) < length(s1)
    for j = 1:length(s2)
        if (k == 0) && (s1(j) ~= s2(j))
            mutIndex = j;
            mutType = '-';
            k = 1;
        end
    end
elseif length(s2) > length(s1)
    for m = 1:length(s2)
        if (k == 0) && (s1(m) ~= s2(m))
            mutIndex = m-1;
            mutType = '+';
            k = 1;
        end
    end
end
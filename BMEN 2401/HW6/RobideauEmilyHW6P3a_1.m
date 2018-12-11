% Author: Emily Robideau
% Assignment: HW6 P3a_1
% Collaborators: None
state = rand();
next = rand();
if state <= (1/3)
    if next <= 0.35
        state = 2/3;
    elseif next > 0.93
        state = 3/3;
    else
        state = 1/3;
    end
elseif state > 2/3
    if next <= 0.04
        state = 1/3;
    elseif next > 0.51
        state = 2/3;
    else
        state = 3/3;
    end
else
    if next <= 0.01
        state = 1/3;
    else
        state = 2/3;
    end
end
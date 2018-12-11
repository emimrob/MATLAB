% Author: Emily Robideau
% Assignment: HW6 P3b_1
% Collaborators: None
function output = RobideauEmilyHW6P3b(N)
output = zeros(1,3);
state = rand();
for i = 1:(N + (N/10))
    next = rand();
    if state <= (1/3)
        output(1,1) = (output(1,1) + 1);
        if next <= 0.35
            state = 2/3;
        elseif next > 0.93
            state = 3/3;
        else
            state = 1/2;
        end
    elseif state > 2/3
        output(1,3) = (output(1,3) + 1);
        if next <= 0.04
            state = 1/3;
        elseif next > 0.51
            state = 2/3;
        else
            state = 3/3;
        end
    else
        output(1,2) = (output(1,2) + 1);
        if next <= 0.01
            state = 1/3;
        else
            state = 2/3;
        end
    end
end
output = output/N;
function state = MyMSRobideauEmilyHW6P3a_2(state)
% Author: Emily Robideau
% Assignment: HW6 P3a_2
% Collaborators: None
x = rand(); % move forward or stay in current stage
y = rand(); % whether a relapse occurs
if state == 1
    if y <= 0.08
        z = rand();
        if z <= 0.23
            state = 3;
        else
            state = 2;
        end
    end
    if x <= 0.0044
        state = 4;
    else
        state = 1;
    end
elseif state == 2
    if x <= 0.0044
        state = 4;
    else
        state = 1;
    end
elseif state == 3
    if x <= 0.0044
        state = 4;
    else
        state = 1;
    end
elseif state == 4
    if y <= 0.08
        z = rand();
        if z <= 0.23
            state = 6;
        else
            state = 5;
        end
    else
        if x <= 0.0092
            state = 7;
        else
            state = 4;
        end
    end
elseif state == 5
    if x <= 0.0092
        state = 7;
    else
        state = 4;
    end
elseif state == 6
    if x <=
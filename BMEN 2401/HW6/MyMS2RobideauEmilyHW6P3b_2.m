function months = MyMS2RobideauEmilyHW6P3b_2
% Author: Emily Robideau
% Assignment: HW6 P3b_2
% Collaborators: None
state = 1;
n = 0;
months = 0;
while n == 0
    x = rand(); % move forward or stay in current stage
    y = rand(); % whether a relapse occurs
    if state == 1
        if y <= 0.08
            z = rand();
            if z <= 0.23
                state = 3;
                months = months + 1;
            else
                state = 2;
                months = months + 1;
            end
        end
        if x <= 0.0044
            state = 4;
            months = months + 1;
        else
            state = 1;
            months = months + 1;
        end
    elseif state == 2
        if x <= 0.0044
            state = 4;
            months = months + 1;
        else
            state = 1;
            months = months + 1;
        end
    elseif state == 3
        if x <= 0.0044
            state = 4;
            months = months + 1;
        else
            state = 1;
            months = months + 1;
        end
    elseif state == 4
        if y <= 0.08
            z = rand();
            if z <= 0.23
                state = 6;
                months = months + 1;
            else
                state = 5;
                months = months + 1;
            end
        else
            if x <= 0.0092
                state = 7;
                months = months + 1;
            else
                state = 4;
                months = months + 1;
            end
        end
    elseif state == 5
        if x <= 0.0092
            state = 7;
            months = months + 1;
        else
            state = 4;
            months = months + 1;
        end
    elseif state == 6
        if x <= 0.0092
            state = 7;
            months = months + 1;
        else
            state = 4;
            months = months + 1;
        end
    elseif state == 7
        if x <= 0.0036
            state = 8;
            months = months + 1;
        else
            state = 7;
            months = months + 1;
        end
    elseif state == 8
        state = 8;
        months = months + 1;
        n = 1;
    end
end
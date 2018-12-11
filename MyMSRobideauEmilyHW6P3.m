function newstate = MyMSRobideauEmilyHW6P3(oldstate)
x = rand(); % move forward or stay in current stage
y = rand(); % whether a relapse occurs
if oldstate == 1
    if y <= 0.08
        z = rand();
        if z <= 0.23
            newstate = 3;
        else
            newstate = 2;
        end
    end
    if x <= 0.0044
        newstate = 4;
    else
        newstate = 1;
    end
elseif oldstate == 2
    if x <= 0.0044
        newstate = 4;
    else
        newstate = 1;
    end
elseif oldstate == 3
    if x <= 0.0044
        newstate = 4;
    else
        newstate = 1;
    end
elseif oldstate == 4
    if y <= 0.08
        z = rand();
        if z <= 0.23
            newstate = 6;
        else
            newstate = 5;
        end
    else
        if x <= 0.0092
            newstate = 7;
        else
            newstate = 4;
        end
    end
elseif oldstate == 5
    if x <= 0.0092
        newstate = 7;
    else
        newstate = 4;
    end
elseif oldstate == 6
    if x <= 0.0092
        newstate = 7;
    else
        newstate = 4;
    end
elseif oldstate == 7
    if x <= 0.0036
        newstate = 8;
    else
        newstate = 7;
    end
elseif oldstate == 8
    newstate = 8;
end
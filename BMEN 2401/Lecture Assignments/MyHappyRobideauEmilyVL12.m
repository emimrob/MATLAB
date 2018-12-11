function mood = MyHappyRobideauEmilyVL12(input)
% Author: Emily Robideau
% Assignment: VL12
% Collaborators: None
x = rand();
if input == 1
    if x >= 0.3
        mood = 1;
    else
        mood = 2;
    end
else
    if x >= 0.4
        mood = 1;
    else
        mood = 2;
    end
end

function score = MyDiceRobideauEmilyVL11
% Author: Emily Robideau
% Assignment: VL11
% Collaborators: None
roll = zeros(4,1);
for i = 1:4
    roll(i,1) = ceil(6*rand());
end
roll
score = sum(roll) - min(roll);
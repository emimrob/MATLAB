% Author: Emily Robideau
% Assignment: HW7 P1a
% Collaborators: None

x = 0.5 * randn() + 3;
if (x > 4.5) || (x < 1.5)
    x = 0.5 * randn() + 3;
end
disp(x);
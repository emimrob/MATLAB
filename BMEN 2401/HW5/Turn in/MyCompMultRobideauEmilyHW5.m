function z = MyCompMultRobideauEmilyHW5 (z1, z2)
% Author: Emily Robideau
% Assignment: HW5 P2b
% Collaborators: None
z(1,1) = z1(1,1)*z2(1,1) + (-1)*z1(1,2)*z2(1,2);
z(1,2) = z1(1,2)*z2(1,1) + z1(1,1)*z2(1,2);
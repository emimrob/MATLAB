function z = MyCompDiv(z1,z2)
% Emily Robideau, 10-2-18
% HW5 P2c
% Collaborators: None
z(1,1) = (z1(1,1)*z2(1,1) + z1(1,2)*z2(1,2))/(z2(1,1)^2 + z2(1,2)^2);
z(1,2) = (z1(1,2)*z2(1,1) + (-1)*z1(1,1)*z2(1,2))/(z2(1,1)^2 + z2(1,2)^2);
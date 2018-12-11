% Emily Robideau, 10-3-18
function fBreak = MyBonesRobideauEmilyHW5(age)
% Author: Emily Robideau
% Assignment: HW5 P3
% Collaborators: None
radius = 1.5 + 0.033*age;
length = 15.3 + 0.37*age;
stress = 48.41 + 3.07*age;
ami = (pi*(radius)^4)/4;
fBreak = (8 * stress * ami)/(2*radius*length);
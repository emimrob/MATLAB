function d = TravelingSalesmanRobideauEmily(xv,yv,r)
% Author: Emily Robideau
% Collaborators: None
% Assignment: Lecture Assignment 21
N = length(r);
d = 0;
for i = 2:N
    x = sqrt((xv(r(i))-xv(r(i-1)))^2 + (yv(r(i))-yv(r(i-1)))^2);
    d = d + x;
end
z = sqrt((xv(r(1))-xv(r(N)))^2 + (yv(r(1))-yv(r(N)^2)));
d = d + z;
% Emily Robideau, 10-3-18
function [dy,d2y] = MyDerivs(fh,x)
h = 1e-5;
y1 = feval(fh,x-h);
y2 = feval(fh,x);
y3 = feval(fh,x+h);
dy = (y3-y1)/(2*h);
d2y = (y1 - (2*y2) + y3)/(h^2);
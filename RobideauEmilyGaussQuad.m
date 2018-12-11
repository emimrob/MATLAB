function [f,f2,N] = RobideauEmilyGaussQuad(fh,a,b,tol)
% Author: Emily Robideau
% Collaborators: None
% Assignment: HW10 P2a

w1 = (5*(b-a))/18;
w2 = (8*(b-a))/18;
x0 = (a+b)/2;
h = (b-a)*sqrt(0.15);
f = w1*feval(fh,(x0-h)) + w2*feval(fh,x0) + w1*feval(fh,(x0+h));

f2 = 0;
N = 0;
e1 = abs((f-0.8)/0.8);
e2 = abs((f2-0.8)/0.8);
while abs(e1 - e2) > tol && N < 1000
    N = N + 1;
    f2 = 0;
    h = (b-a)/N;
    for k = 1:N
        x = (k-1)*h + a;
        y = x + h;
        f2 = f2 + (feval(fh,x) + feval(fh,y))*(h/2);
    end
    e2 = abs((f2-0.8)/0.8);
end
%It takes 11 trapezoids to get the same accuracy
%with tol = 1e-03
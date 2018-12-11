function number = RobideauEmilyHW6P4
% Author: Emily Robideau
% Assignment: HW6 P4
% Collaborators: None
p = -1;
sequence = zeros();
n = 2;
sequence(1) = rand();
sequence(2) = rand();
x = 0;
while x == 0
    p = p + 1;
    while sequence(n) <= sequence(n-1)
        sequence(n+1) = rand();
        n = n + 1;
    end
    x = mod(floor(sequence(n-1)*10000),2);
end
number = sequence(1) + p;
v = zeros(100000,1); for i = 1:100000; v(i) = MyExpDist();end
histogram(v);
hold on;
v2 = zeros(100000,1); for i = 1:100000; v2(i) = -log(rand());end
histogram(v2);
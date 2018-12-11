% Author: Emily Robideau
% Assignment: HW6 P2 parts b and c
% Collaborators: None
sequence = zeros(10000,1);
x = RandGenRobideauEmilyHW6P2a(rand()*10000);
for i = 1:2500
    sequence(4*i,1) = mod(x,10);
    sequence((4*i)-1,1) = floor((1/10)*mod(x,100));
    sequence((4*i)-2,1) = floor((1/100)*mod(x,1000));
    sequence((4*i)-3,1) = floor((1/1000)*mod(x,10000));
    x = RandGenRobideauEmilyHW6P2a(x);
end
digs = zeros(10,1);
for j = 1:9999
    digs(sequence(j,1)+1) = digs(sequence(j,1)+1) + 1;
end

%Part c: repeating sequence at the end is 2100, 4100, 8100, 6100
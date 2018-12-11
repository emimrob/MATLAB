function x = RobideauEmilyMyForwardSub(L,b)
% Author: Emily Robideau
% Collaborators: None
% Assignment: HW8 P2
N = length(L);
x = zeros(N,1);
for i = 1:N
    for j = 1:(i-1)
        b(i,1) = b(i,1) - L(i,j) * x(j,1);
    end
    x(i,1) = b(i,1) / L(i,i);
end
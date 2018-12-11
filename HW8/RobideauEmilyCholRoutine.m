function x = RobideauEmilyCholRoutine(A,b)
% Author: Emily Robideau
% Collaborators: None
% Assignment: HW8 P4
N = length(A);
L = zeros(N,N);

%Cholesky decomposition

for k = 1:N
    sum = 0;
    for p = 1:(k-1)
        product = (L(k,p))*(L(k,p));
        sum = sum + product;
    end
    L(k,k) = sqrt((A(k,k)) - sum);
    for i = (k+1):N
        sum2 = 0;
        for q = 1:(k-1)
            product2 = (L(i,q))*(L(k,q));
            sum2 = sum2 + product2;
        end
        math = A(i,k) - sum2;
        L(i,k) = (math/(L(k,k)));
    end
end

% Forward substitution

N = length(L);
y = zeros(N,1);
for m = 1:N
    for n = 1:(m-1)
        b(m,1) = b(m,1) - L(m,n) * y(n,1);
    end
    y(m,1) = b(m,1) / L(m,m);
end

% Back substitution

x = zeros(N,1);
M = L';
for s = N:(-1):1
    for t = (s+1):N
        y(s,1) = y(s,1) - M(s,t) * x(t,1);
    end
    x(s,1) = y(s,1) / M(s,s);
end
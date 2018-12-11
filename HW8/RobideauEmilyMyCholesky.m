function L = RobideauEmilyMyCholesky(A)
% Author: Emily Robideau
% Collaborators: None
% Assignment: HW8 P3
N = length(A);
L = zeros(N,N);
for k = 1:N
    sum = 0;
    sum2 = 0;
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
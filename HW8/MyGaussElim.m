function x = MyGaussElim (A, b)
% Author: Emily Robideau
% Collaborators: Nitali Arora
% Assignment: HW8 P1

N = length (b);
x = zeros(N,1);

% The elimination loops

for i = 1:(N-1)
    for j = (i+1):N
        if A(i,i) == 0
            z = 0;
            for m = (i+1):N
                if (A(m,i) ~= 0) && (z == 0)
                    temp = A(i,:);
                    A(i,:) = A(m,:);
                    A(m,:) = temp;
                    temp = b(i,1);
                    b(i,1) = b(m,1);
                    b(m,1) = temp;
                    z = 1;
                end
            end
        end
        f = A(j,i) / A(i,i);
        for k = i:N
            A(j,k) = A(j,k) - f * A(i,k);
        end
        b(j,1) = b(j,1) - f * b(i,1);
    end
end

% Back Substitution

for i = N:(-1):1
    for j = (i+1):N
        b(i,1) = b(i,1) - A(i,j) * x(j,1);
    end
    x(i,1) = b(i,1) / A(i,i);
end


end
A = magic(3)
AI=inv(A)
IPredicted = A*AI
IM=eye(3)
difference=IPredicted-IM
for m = 1:3
        for n = 1:3
                if difference(m,n)<eps;
                    IPredicted(m,n)=IM(m,n);
                end
        end
end
IPredicted
IPredicted == IM
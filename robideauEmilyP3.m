% Emily Robideau, 9-24-18
M=dlmread('Shoulder.txt','\t');
fv=M(210:360,1);
ev=M(210:360,2);
A(1:151,1)=ones(151,1);
A(1:151,2)=fv;
x=(A'*A)\(A'*ev);
angVel=x(2,1)*30;
% Emily Robideau, 9-27-18
f=1;
N=input('Pick a number.');
for i=1:N
    f=f*i;
end
disp([num2str(N) '! = ' num2str(f)]);
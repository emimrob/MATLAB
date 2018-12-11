% Emily Robideau, 9-27-18
str = input('Choose a statement.');
c = 1;
N = length(str);
while (c <= N) && (str(c) ~= ' ') 
    m = str(c);
    c = c + 1;
end
disp(['The last letter of the first word is ' m]);
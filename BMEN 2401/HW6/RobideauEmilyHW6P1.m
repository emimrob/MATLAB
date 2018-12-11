% Author: Emily Robideau
% Assignment: HW6 P1
% Collaborators: Nitali Arora
v = zeros(100000,1);
for i = 1:100000
    v(i,1) = floor(10*rand());
end
digs = zeros(10,1);
for j = 1:100000
    digs(v(j,1)+1) = digs(v(j,1)+1) + 1;
end
pairs = zeros(100,1);
for k = 1:99999
    pairs((10*v(k,1)+v(k+1,1))+1) = pairs((10*v(k,1)+v(k+1,1))+1) + 1;
end
bar(pairs)
gaps = zeros((digs(1,1) - 1),1);
w = 0;
for m = 1:100000
    if v(m,1) == 0
        w = w + 1;
    else
        if w ~= 0 && w ~= digs(1,1)
            gaps(w) = gaps(w) + 1;
        end
    end
end
histogram(gaps,max(gaps),'facecolor','yellow');
hold on
fplot('10000*0.1*0.9^x', [0 max(gaps)],'black');
hold off
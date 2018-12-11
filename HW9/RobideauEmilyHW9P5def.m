% Author: Emily Robideau
% Collaborators: None
% Assignment: HW9 P5def

% part d
str2 = 'nrbbtoooeteot';
str1 = 'tobeornottobe';
N = length(str2);
score = 0;
for i = 1:N
    if str2(i) == str1(i)
        score = score + 10;
    end
end

scorev = zeros(1,10000);
for j = 1:10000
    y = ceil(N*rand());
    z = ceil(N*rand());
    a1 = 0;
    a2 = 0;
    b1 = 0;
    b2 = 0;
    if str1(y) == str2(y)
        a1 = a1 + 10;
    end
    if str1(z) == str2(z)
        b1 = b1 + 10;
    end
    if str1(y) == str2(z)
        a2 = a2 + 10;
    end
    if str1(z) == str2(y)
        b2 = b2 + 10;
    end

    newscore = score + (a2-a1) + (b2-b1);
    n = rand();
    p = exp((newscore - score)/2);

    if newscore > score
        temp = str2(y);
        str2(y) = str2(z);
        str2(z) = temp;
        score = newscore;
    elseif (newscore < score) && (n <= p)
        temp = str2(y);
        str2(y) = str2(z);
        str2(z) = temp;
        score = newscore;
    end
    scorev(j) = score;
end

plot(scorev);

% part e
scorev = zeros(1,10000);
for j = 1:10000
    y = ceil(N*rand());
    z = ceil(N*rand());
    a1 = 0;
    a2 = 0;
    b1 = 0;
    b2 = 0;
    if str1(y) == str2(y)
        a1 = a1 + 10;
    end
    if str1(z) == str2(z)
        b1 = b1 + 10;
    end
    if str1(y) == str2(z)
        a2 = a2 + 10;
    end
    if str1(z) == str2(y)
        b2 = b2 + 10;
    end

    newscore = score + (a2-a1) + (b2-b1);
    n = rand();
    p = exp((newscore - score)/5);

    if newscore > score
        temp = str2(y);
        str2(y) = str2(z);
        str2(z) = temp;
        score = newscore;
    elseif (newscore < score) && (n <= p)
        temp = str2(y);
        str2(y) = str2(z);
        str2(z) = temp;
        score = newscore;
    end
    scorev(j) = score;
end
figure;
plot(scorev);

% part f
scorev = zeros(1,10000);
for j = 1:10000
    y = ceil(N*rand());
    z = ceil(N*rand());
    a1 = 0;
    a2 = 0;
    b1 = 0;
    b2 = 0;
    if str1(y) == str2(y)
        a1 = a1 + 10;
    end
    if str1(z) == str2(z)
        b1 = b1 + 10;
    end
    if str1(y) == str2(z)
        a2 = a2 + 10;
    end
    if str1(z) == str2(y)
        b2 = b2 + 10;
    end

    newscore = score + (a2-a1) + (b2-b1);
    n = rand();
    p = exp((newscore - score)/20);

    if newscore > score
        temp = str2(y);
        str2(y) = str2(z);
        str2(z) = temp;
        score = newscore;
    elseif (newscore < score) && (n <= p)
        temp = str2(y);
        str2(y) = str2(z);
        str2(z) = temp;
        score = newscore;
    end
    scorev(j) = score;
end
figure;
plot(scorev);
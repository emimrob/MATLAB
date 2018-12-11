% Hammurabi
% Orinigal BASIC version (C) Creative Computing, Morristown, NJ
% Translated into Matlab by V. Barocas, 2018

imp = 0;

cr = sprintf('\n');

disp ('Welcome, Hammurabi');
disp ('Try your hand at governing ancient Sumeria');
disp ('for a ten-year term of office.');
disp (cr);

disp ('Note: A person eats 20 bushels per year.');
disp ('Note: Planting 1 acre requires 0.1 persons and 0.5 bushels');

d1 = 0;
p1 = 0;
z = 1;
p = 95;
s = 2800;
h = 3000;
e = h - s;
y = 3;
a = h/y;
i = 5;
q = 1;
d = 0;


for z = 1:10
    disp ([cr, cr, 'Hammurabi, I beg to report that in year ', ...
        num2str(z-1)]);
    disp ([num2str(d), ' people starved and ', num2str(i), ...
        ' moved to the city']);
    p = p + i;
    if q <= 0
        disp ('A horrible plague struck! Half the people died!')
        p = floor(p / 2);
    end
    disp (['The population is now ', num2str(p), '.']);
    disp (['The city now owns ', num2str(a), ' acres of land.']);
    disp (['We harvested ', num2str(y), ' bushels of grain per acre.']);
    disp (['Rats ate ', num2str(e), ' bushels.']);
    disp (['You have ', num2str(s), ' bushels in the storehouses.', cr]);
    
    c = floor(10 * rand());
    y = c + 17;
    
    disp (['Land is now trading at ', num2str(y), ' bushels per acre.']);
    q = floor(input('How many acres do you wish to buy? '));
    while (q < 0) || (y*q > s)
        if q < 0
            disp ('You cannot buy negative land; you will have a chance to sell later.');
        else
            disp (['Hammurabi, think again! You only have ', num2str(s), ...
                ' bushels!']);
        end
        q = floor(input('How many acres do you wish to buy? '));
    end
    
    if q > 0
        a = a + q;
        s = s - y * q;
        c = 0;
    else
        q = floor(input('How many acres do you wish to sell? '));
        while q < 0
            disp ('You cannot sell negative land.');
            q = floor(input('How many acres do you wish to sell? '));
        end
        a = a - q;
        s = s + y * q;
        c = 0;
    end
    q = floor(input('How many bushels do you wish to feed to the people? '));
    while (q < 0) || (q > s)
        if q < 0
            disp ('The people cannot eat negative food.');
        else
            disp (['The storehouses only contain ', num2str(s), ' bushels!']);
        end
        q = floor(input('How many bushels do you wish to feed to the people? '));
    end
    s = s - q;
    c = 1;
    
    d = floor(input('How many acres do you wish to plant? '));
    d_ok = 0;
    while d_ok == 0
        d_ok = 1;
        if d < 0
            disp('You cannot plant negative acres.');
            d_ok = 0;
        elseif d > a
            disp (['You only have ', num2str(a), ' acres to plant.']);
            d_ok = 0;
        elseif d > 2*s
            disp (['You only have enough grain to plant ', ...
                num2str(2*s), ' acres.']);
            d_ok = 0;
        elseif d > 10*p
            disp (['You only have enough people to plant ', ...
                num2str(10*p), ' acres.']);
            d_ok = 0;
        end
        
        if d_ok == 0
            d = floor(input('How many acres do you wish to plant? '));
        end
    end
    s = s - floor(d/2);
    
    disp(cr);
    
    % Compute harvest
    c = floor(rand()*5 + 1);
    y = c;
    h = d*y;
    
    % Check for rats
    e = 0;
    c = floor(rand()*5 + 1);
    if (mod(c,2) == 0)
        e = floor(s/c);
    end
    s = s - e + h;

    % Population growth
    c = floor(rand()*5 + 1);
    i = floor(c*(20*a+s) / (100*p) + 1);
    
    c = floor(q/20);
    q = floor(10*(2*rand()-0.3));
    d = 0;
    
    if p > c
        d = p - c;
        if d > (0.45*p)
            disp (['You starved ', num2str(d), ' people in one year!']);
            disp ('Due to your horrible mismanagement, you have been');
            disp ('Impeached in mid-term.');
            p1 = floor(((z-1)*p1+d*100/p)/z);
            p = c;
            d1 = d1 + d;
            imp = 1;
            break
        end
        p1 = floor(((z-1)*p1+d*100/p)/z);
        p = c;
        d1 = d1 + d;
    end
end

disp (['Your term has ended. A total of ', num2str(d1), ' people starved,']);
disp (['for an average starvation rate of ', num2str(p1), '% / yr.']);
l = a/p;
disp ('You started with 10 acres per person and ended with');
disp ([num2str(l), ' acres per person.', cr]);

if (imp ~= 1)
    if (p1 > 33) || (l < 7)
        disp ('You were a terrible leader for the city.  The end of your');
        disp ('reign is declared a city holiday.');
    elseif (p1 > 10) || (l < 9)
        disp ('Well, you were probably better than Ivan the Terrible. The');
        disp ('few remaining people are certainly glad to see you go.');
    elseif (p1 > 3) || (l < 10)
        disp ('A very respectable performance. Some people were not happy,');
        disp ('but you cannot please everyone all of the time, you know.');
    else
        disp ('A fantastic job! The people build a statue of you in the');
        disp ('town square!');
    end
end
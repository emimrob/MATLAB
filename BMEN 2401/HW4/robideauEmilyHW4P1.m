if (x == 1)
    x = 2;
    if (y == 1)
        x = 3;
        z = 1;
    else
        x =1;
        y = 3;
    end
    if (x > y)
        x = y;
        z = x;
    elseif (y > z)
        y = x;
        x = 4;
    else
        x = y + z;
        z = y + x;
    end
end
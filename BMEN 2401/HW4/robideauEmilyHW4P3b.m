% Emily Robideau, 9-28-18
StPaul =dlmread('Clim.txt');
for m = 1:11
    if (StPaul(m,1) < 14) && (StPaul(m+1,1) > 14)
        WinterEnd = m + ((14 - StPaul(m,1))/(StPaul(m+1,1) - StPaul(m,1)));
    elseif (StPaul(m,1) > 18) && (StPaul(m+1,1) < 18)
        SummerEnd = m + ((18 - StPaul(m,1))/(StPaul(m+1,1) - StPaul(m,1)));
    elseif (StPaul(m,1) > 14) && (StPaul(m+1,1) < 14)
        WinterStart = m + ((14 - StPaul(m,1))/(StPaul(m+1,1) - StPaul(m,1)));
    elseif (StPaul(m,1) < 18) && (StPaul(m+1,1) > 18)
        SummerStart = m + ((18 - StPaul(m,1))/(StPaul(m+1,1) - StPaul(m,1)));
    end
end
WinterLength = (12 - WinterStart) + WinterEnd;
SummerLength = SummerEnd - SummerStart;
AutumnLength = WinterStart - SummerEnd;
SpringLength = SummerStart - WinterEnd;
WinterPrecip = 0;
SpringPrecip = 0;
SummerPrecip = 0;
AutumnPrecip = 0;
for n = 1:12
    while (n >= WinterStart) || (n <= WinterEnd)
        WinterPrecip = sum(StPaul(n,2));
    end
end
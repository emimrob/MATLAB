% Emily Robideau, 9-26-18
SummerLength = input('What is the length (in months) of summer in the region?');
AutumnLength = input('What is the length (in months) of autumn in the region?');
WinterLength = input('What is the length (in months) of winter in the region?');
SpringLength = input('What is the length (in months) of spring in the region?');
SummerPrecip = input('How much precipitation (in mm) does the region get in the summer?');
AutumnPrecip = input('How much precipitation (in mm) does the region get in the autumn?');
WinterPrecip = input('How much precipitation (in mm) does the region get in the winter?');
SpringPrecip = input('How much precipitation (in mm) does the region get in the spring?');
M=[SummerLength SummerPrecip; AutumnLength AutumnPrecip; WinterLength WinterPrecip; SpringLength SpringPrecip];
AnnualPrecip = SummerPrecip + AutumnPrecip + WinterPrecip + SpringPrecip;
if (WinterPrecip > 375)
    if (SummerPrecip > 60)
        disp("The region's biome is Closed Forest Broadleaf.");
    else
        disp("The region's biome is Closed Forest Conifer.");
    end
else
    if (AnnualPrecip > 1100)
        disp("The region's biome is Closed Forest (Subtropical Broadleaf).");
    else
        if (WinterPrecip <= 80)
            if (SpringPrecip > 20*SpringLength)
                if (SummerPrecip > 70*SummerLength)
                    disp("The region's biome is Tall Grass.");
                else
                    disp("The region's biome is Short Grass.");
                end
            else
                disp("The region's biome is Desert.");
            end
        else
            if (SpringPrecip <= 20*SpringLength)
                if (WinterPrecip > 305)
                    disp("The region's biome is Pygmy Forest (No Grass).");
                else
                    disp("The region's biome is Shrubland (No Grass).");
                end
            else
                if (SummerPrecip > 70*SummerLength)
                    if (WinterPrecip > 305)
                        disp("The region's biome is Tall Grass (Tree Savanna) (Broadleaf).");
                    else
                        disp("The region's biome is Tall Grass (Shrub Savanna).");
                    end
                else
                    if (SummerPrecip > 28*SummerLength)
                        if (WinterPrecip > 305)
                            disp("The region's biome is Short Grass (Shrubland).");
                        else
                            disp("The region's biome is Short Grass (Pygmy Forest).");
                        end
                    else
                        if (WinterPrecip > 305)
                            disp("The region's biome is Pygmy Savanna (Short Grass).");
                        else
                            disp("The region's biome is Shrub Savanna (Short Grass).");
                        end
                    end
                end
            end
        end
    end
end

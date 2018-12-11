% Emily Robideau, 9-24-18
Mucus = input('How often do you cough up mucus?'); % enter 0-4
NoisyChest = input('How often does your chest sound noisy when you breathe?'); % enter 0-4
ShortBreath = input('How often do you experience shortness of breath during physical activity?'); % enter 0-4
SmokeYears = floor((1/10)*input('How many years have you smoked?'));
Age = floor((1/10)*input('What is your age?'));
scoreCOPD = Mucus + NoisyChest + ShortBreath + SmokeYears + Age;
if (scoreCOPD >= 12)
disp ('You are at high risk for COPD');
else
disp ('You are at low risk for COPD');
end

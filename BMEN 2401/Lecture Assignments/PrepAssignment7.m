% Emily Robideau, 9-25-18
Guess = input('What is your guess?');
GameAnswer = 42;
if (Guess < GameAnswer)
    disp('Your guess is too low!');
elseif (Guess > GameAnswer)
    disp('Your guess is too high!');
else
    disp('Your guess is right!');
end
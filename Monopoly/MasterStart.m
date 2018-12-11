function [numberofrounds,PlayerCell,N,TaxedMoney,Properties,Players,BoardCell, PlayerNames] = MasterStart()
BoardCell = {'Go', 'Biomedical Library', 'Lind Hall', 'Community Chest', 'Walter Library', 'Jail', 'Mechanical Engineering Building,' 'Amundson Hall', 'Keller Hall', 'Tate Hall', 'Income tax', 'Molecular and Cellular Biology Building', 'Moos Tower', 'Free Parking', 'Mayo Building', 'Go to Jail!', 'Recreation and Wellness Center', 'Coffman Memorial Union', 'Northrop Auditorium', 'TCF Bank Stadium'};
PlayerCell= {'Victor','Tiffany','Ken','Ryan','Sachs'};
PlayerPossible = {'Victor','Tiffany','Ken','Ryan','Sachs'};
disp("Welcome to the game of Monopoly: University of Minnesota!")
pause(2);
disp("Here are the rules.")
disp("The objective is to get the most amount of money by the end of the game.")
disp("To achieve this objective, you can purchase properties and charge rent.")
pause(5);
disp("Ok let's get started!")
pause(2);
numberofrounds = input("How many rounds do you want to play? \nOne round is everyone playing once.\n");
disp("How many players do you have?")
Numberofplayers = input("You can only play with 2-5 players\n");
N = Numberofplayers;
a = 1;
z = 1;
while z == 1
    if N > 5 || N < 2
        if a < 2
            disp('Stop messing with me.')
            disp('It took too long to code all of this.')
            disp('I will release a super fancy virus if you do this again.')
            Numberofplayers = input("\nI am giving you a second chance. How many players do you have?\nYou can only play with 2-5 players\n");
            N = Numberofplayers;
            a = a + 1;
        elseif a < 3
            disp('No seriously. You will not like what is coming to you.')
            disp('Michelle is too powerful and smart.')
            disp('She will release a crazy virus!')
            Numberofplayers = input("\nHere is your last chance. How many players do you have?\nYou can only play with 2-5 players\n");
            N = Numberofplayers;
            a = a + 1;
        elseif a >= 3
            asuperscaryvirus = zeros(1,1000000); %THIS IS NOT AN ERROR. This is the virus I talked about.
            disp(asuperscaryvirus) %This is the super virus let it out.
        end
    else
        z = 0;
    end
end
PlayerNames = cell(1,N);
for i = 1:N
    b = 0;
    while b == 0
        x = strcat('Who does Player  ', num2str(i) ,' want to play as?');
        disp(x)
        disp(PlayerPossible)
        prompt = ("Each person has to have a different identity.\n");
        str = input(prompt,'s');
        if (str(1) == 'V')||(str(1) == 'v')
            PlayerNames(i) = PlayerCell(1);
            b = 1;
            PlayerPossible{1,1} =  '';
        elseif (str(1) == 'T')||(str(1) == 't')
            PlayerNames(i) = PlayerCell(2);
            b = 1;
            PlayerPossible{1,2} = '';
        elseif (str(1) == 'K')||(str(1) == 'k')
            PlayerNames(i) = PlayerCell(3);
            b = 1;
            PlayerPossible{1,3} = '';
        elseif (str(1) == 'R')||(str(1) == 'r')
            PlayerNames(i) = PlayerCell(4);
            b = 1;
            PlayerPossible{1,4} = '';
        elseif (str(1) == 'S')||(str(1) == 's')
            PlayerNames(i) = PlayerCell(5); 
            b = 1;  
            PlayerPossible{1,5} = '';
        end
    end
%maybe insert display of which character was chosen
end
disp("");
disp("The random order of play is as follows")
order = zeros(1,N);
for i = 1:N
    order(i) = i;
end
tempPlayerNames = PlayerNames;
order = randperm(length(order));
for i = 1:N
    PlayerNames(i) = tempPlayerNames(order(i));
end
disp(PlayerNames) %PlayerNames shows the Players in the order they will play in
Properties = zeros(3,20);
Properties(2,:) = [0 25 50 0 75 0 100 125 150 175 0 200 225 0 250 0 275 300 350 400];
Properties(3,:) = [0 2 6 0 10 0 14 18 22 26 0 30 34 0 38 0 42 46 50 54];
Players = zeros(3,N);
Players(1,:) = ones(1,N);
Players(3,:) = 1500;
%Added tax 
TaxedMoney = 0;

function [Players, TaxedMoney] = IncomeTax(Cplayer, Players, Properties, TaxedMoney)
%taxes player if player lands on square
disp('You landed on income tax!');
go = 0;
while (go == 0)
    %ask for $200 tax or 10% tax
    prompt = 'Which tax would you like to pay? To pay $200, enter 200. To pay 10%, enter 10: ';
    whichTax = input(prompt);
    if (whichTax == 200)
        taxed = 200;
        Players(3, Cplayer) = Players(3,Cplayer)-taxed;
        go = 1;
    elseif (whichTax == 10)
        go = 1;
        total = Players(3,Cplayer);
        for y = 1:20
            if (Properties(1,y) == Cplayer)
                total = total + Properties(2,y);
                %adding the worth of each owned property to the amount of
                %money each player has
            end
        end
        taxed = ceil(0.1*total);
        Players(3, Cplayer) = Players(3, Cplayer)- taxed;
    end
end
%save money for free parking
TaxedMoney = TaxedMoney+taxed;
fprintf('You paid $%d in taxes.\n', taxed);

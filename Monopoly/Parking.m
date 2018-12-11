function [Players, TaxedMoney] = Parking(Cplayer,Players, TaxedMoney)
% function for if player lands on free parking. 
%They receive their money from the income tax back
disp('Free parking!');
if (TaxedMoney(Cplayer) ~= 0)
    fprintf('You previously paid $%d in income tax.', TaxedMoney(Cplayer));
    disp(' You will receive this money back now! Congrats!')
    Players(3,Cplayer) = Players(3,Cplayer) + TaxedMoney(Cplayer);
    TaxedMoney(Cplayer) = 0;
else
    disp('You did not pay any income tax previously, but you can chill here for a turn. ');
end
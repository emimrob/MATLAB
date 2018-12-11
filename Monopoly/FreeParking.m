function [Players, TaxedMoney] = FreeParking(Cplayer,Players, TaxedMoney)
%function for if player lands on free parking. 
%They receive their money from the income tax back
if(TaxedMoney ~= 0)    
    fprintf('$%d has been paid to income tax.', TaxedMoney);
    disp(' You will receive this money now! Congrats!')
    Players(3,Cplayer) = Players(3,Cplayer) + TaxedMoney;
    TaxedMoney = 0;
else
    disp('Sorry, free parking is empty :(');
end
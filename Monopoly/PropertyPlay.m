function [Players,Properties] = PropertyPlay(PlayerCell,Cplayer,Cplayer_pos,Players,Properties)

%this function is used each time a player lands on a property. It is
%responsible for charging the player if a property is owned or allowing
%them to buy it if it unowned. 

%Author: Michelle Uchenik
%0 means false. Becomes 1 if someone becomes bankrupt and the game is over.
PlayerID = PlayerCell{Cplayer};

if Properties(1,Cplayer_pos)==0 %if the property is unowned
    BuyCost = Properties(2,Cplayer_pos); 
    buy_m1='This property is unowned. It costs ';
    buy_m2 = ' dollars to purchase. ';
    fprintf('%s %d %s\n',buy_m1,BuyCost,buy_m2);
    %Buy_message = strcat('This property is unowned. It costs',' ',num2str(BuyCost),' dollars to purchase. Would you like to buy it? (1=Yes, 0=No) ');
    Buy_input = input('Would you like to buy it? (1=Yes, 0=No) ');
    if ((Players(3,Cplayer)-BuyCost)<0)%if the player can't afford the purchase
        broke_m1=', you are too broke to buy this. Sorry!';
        fprintf('%s %s',PlayerID,broke_m1);
    else %if they can afford it
        if Buy_input == 1 %if the player wants to buy the property
            Properties(1,Cplayer_pos)=Cplayer; %update player matrix with index of current player since they have purchased the property
            Players(3,Cplayer) = Players(3,Cplayer) - BuyCost; %player pays for property
            Balance = Players(3,Cplayer);
            bal_m1 = 'You now have ';
            bal_m2 = ' dollars in your bank account.';
            fprintf('%s %d %s\n',bal_m1,Balance,bal_m2);
        end
    end
else
   RentCost = Properties(3,Cplayer_pos); 
   Prop_own_i = Properties(1,Cplayer_pos); %index of whoever owns this property
   Prop_owner = PlayerCell{Prop_own_i}; %name of property owner
   %Rent_message = strcat('Uh oh! This propert is owned by ',Prop_owner,'. You owe them ', num2str(RentCost), ' dollars in rent');
   rent_m1 = 'Uh oh! This propert is owned by ';
   rent_m2 = '. You owe them ';
   rent_m3 = ' dollars in rent.';
   %fprintf('%s %s %s %d %s\n',rent_m1,Prop_owner,rent_m2,RentCost,rent_m3);
   fprintf('%s %s %s %s %s\n',rent_m1,Prop_owner,rent_m2,num2str(RentCost),rent_m3);
   Players(3,Cplayer) = Players(3,Cplayer) - RentCost;
   Players(3,Prop_own_i) = Players(3,Prop_own_i) + RentCost; %pay rent to the property owner
   Balance = (Players(3,Cplayer));
   bal_m1 = 'You now have ';
   bal_m2 = ' dollars in your bank account';
   %fprintf('%s %d %s\n',bal_m1,Balance,bal_m2);
   fprintf('%s %d %s\n',bal_m1,Balance,bal_m2);
   if Players(3,Cplayer)<0 %if the player has run out of money
       GameOver(); %????
   end
end
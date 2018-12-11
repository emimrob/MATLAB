function [TaxedMoney,Players,Properties] = GamePlay(TaxedMoney,PlayerCell,BoardCell,Cplayer,Players,Properties,Property_Vec)

num_players = length(PlayerCell);
PlayerID = PlayerCell{Cplayer};
%cplayer is index of current player
Cplayer_pos = Players(1,Cplayer); %numerical position of current player, 1-20
jail_status = Players(2,Cplayer); 

if (jail_status ==1)
	Players(3,Cplayer) = 0; %skips a turn but player can move on the next turn
    disp('Sorry, you will be staying in jail for 1 turn. ');
    
else
    %normal turn if player is not in jail
    %cplayer is index of current player in matrix
        D1 =ceil(rand()*6); %dice roll 
        D2 =ceil(rand()*6);
        Myroll = D1+D2; %dice roll
        Roll_message = strcat(PlayerID,', you have rolled: ',' ',num2str(Myroll));
        disp(Roll_message); %display the dice roll
    
    Cplayer_pos = Cplayer_pos+Myroll;
    if Cplayer_pos>20 %if player passes go
        Cplayer_pos = Cplayer_pos-20;%only 20 spots on the board
        Players(3,Cplayer) = Players(3,Cplayer)+200; %earn money from passing go
    end
    Players(1,Cplayer) =  Cplayer_pos; %update new position in player matrix
    %%Insert code to update player’s position here%%
    disp(['You have landed on ' BoardCell{Cplayer_pos}]);
    
    %what to do for each type of position
    if Property_Vec(Cplayer_pos)==1 %if you land on a property
       [Players,Properties] = PropertyPlay(PlayerCell,Cplayer,Cplayer_pos,Players,Properties);
    elseif (Cplayer_pos==4) %if you land on community chest
        %randomly choose a community chest card
        disp('You have landed on community chest!');
        [Cplayer_pos,Players,Properties] = CommunityChest(PlayerCell,Cplayer,Cplayer_pos,Players,Properties)
    elseif (Cplayer_pos==11)
        %if you land on income tax
        [Players, TaxedMoney] = IncomeTax(Cplayer, Players, Properties, TaxedMoney);
        %update the free parking stash 
    elseif (Cplayer_pos==14)
        %if you land on free parking
        [Players, TaxedMoney] = FreeParking(Cplayer,Players,TaxedMoney);
    elseif (Cplayer_pos==16)
       [Cplayer_pos,Players] = GoToJail(Cplayer_pos,Players,Cplayer) 
    end
    
end

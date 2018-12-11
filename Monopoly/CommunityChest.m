function [Cplayer_pos,Players,Properties] = CommunityChest(PlayerCell,Cplayer,Cplayer_pos, Players,Properties)

%Author: Michelle Uchenik

%This function simulates drawing a community chest card and what happens as
%a result

num_players = length(PlayerCell);
CommChest = {'You owe your friends money from a concert you went to last week when you forgot your wallet! Pay each player $50.', 'There’s a football game tonight, go Gophers! Advance to TCF Bank Stadium.', 'You just realized you forgot to do the chemistry homework this week, and it was due yesterday. Go back 3 spaces.', 'It’s your birthday, and your grandma sent you some money! Collect $50 from the bank.', 'Advance to Go and collect $200.'};

ccard = ceil(rand()*5);

c_message = CommChest{ccard};

c_intro ='The card you drew is:';
fprintf('%s\n %s\n',c_intro,c_message);
if ccard == 1 %pay your friends money!
    Players(3,Cplayer) = Players(3,Cplayer)-(50*num_players);
    Balance = Players(3,Cplayer);
    bal_m1 = 'You now have ';
    bal_m2 = ' dollars in your bank account.';
    fprintf('%s %d %s\n',bal_m1,Balance,bal_m2);
%removed loop update of paying each player
    if Players(3,Cplayer)<0 %if the player has run out of money
        GameOver() %adjust if the function needs imputs
    end
    Cplayer_pos = Cplayer_pos;
elseif ccard == 2 %Go to TCF!
    Cplayer_pos = 20; %update player's position as a variable
    Players(2,Cplayer) = 20; %update on the player matrix
    [Players,Properties] = PropertyPlay(PlayerCell,Cplayer,Cplayer_pos,Players,Properties);
    %deal with rent or any purchases as necessary
elseif ccard == 3 %Go back 3 spaces!
    Cplayer_pos = Cplayer_pos-3;
    if Cplayer_pos <1 %passed go going backwards
        Cplayer_pos = Cplayer_pos + 20 %correction to have an integer 1-20
    end
    Players(2,Cplayer) = Cplayer_pos; %update the matrix
    [Players,Properties] = PropertyPlay(PlayerCell,Cplayer,Cplayer_pos,Players,Properties);
    %deal with rent or any purchases as necessary
elseif ccard == 4 %collect 50 bucks!
    Players(3,Cplayer) = Players(3,Cplayer)+50;
    Balance = Players(3,Cplayer);
    bal_m1 = 'You now have ';
    bal_m2 = ' dollars in your bank account.';
    fprintf('%s %d %s\n',bal_m1,Balance,bal_m2);
else %advance to go and collect 200 bucks
    Cplayer_pos = 1; %update player's position as a variable
    Players(2,Cplayer) = 1; %update on the player matrix
    Players(3,Cplayer) = Players(3,Cplayer)+200;
    Balance = Players(3,Cplayer);
    bal_m1 = 'You now have ';
    bal_m2 = ' dollars in your bank account.';
    fprintf('%s %d %s\n',bal_m1,Balance,bal_m2);
end
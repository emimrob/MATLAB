function [z,Players,PlayerNames,Properties] = CheckBroke(N,Players,Cplayer,PlayerNames,Properties,Z)
%N = number of players at the beginning of the game
%Z = number of players right now
%This function checks to see if the player has low money and asks them
%if they want to declare bankruptcy, and if they do it removes them
%from the game, lets them know they're out, puts their owned properties
%back on the market, and prints z = number of players who are bankrupt
if Players(3,Cplayer) <= 75
    x = input('Would you like to declare bankruptcy? 1 = yes, 0 = no');
    if x == 1
        for i = 1:20
            if Properties(1,i) == Cplayer
                Properties(1,i) = 0;
            end
        end
        %The following recreates Player & PlayerNames arrays w/o info of
        %the player who declared bankruptcy
        k = 0;
        NewPlayerNames = cell(1,Z-1);
        NewPlayers = zeros(3,Z-1);
        for j = 1:Z
            if j ~= Cplayer
                a = PlayerNames(j);
                b = Players(:,j);
                k = k + 1;
                NewPlayerNames(k) = a;
                NewPlayers(:,k) = b;
            end
        end
        PlayerNames = NewPlayerNames;
        Players = NewPlayers;
        z = N - length(PlayerNames); %This calculates how many people have
        %declared bankruptcy, N is the total number of players at
        %the start, so if all but one player declares bankruptcy, the game
        %ends and that person wins
        c = PlayerNames(Cplayer);
        str1 = 'Player';
        str2 = ", you've declared bankruptcy. You are now out of the game and your properties have been put back on the market for repurchase.";
        fprintf('%s %d %s',str1,Cplayer,str2)
    end
end
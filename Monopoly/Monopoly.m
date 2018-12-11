function Monopoly()

[totalrounds,PlayerCell,N,TaxedMoney,Properties,Players,BoardCell, PlayerNames] = MasterStart();
Property_Vec = [0 1 1 1 0 0 1 1 1 1 0 1 1 0 1 0 1 1 1 1];

rounds = 0;
IsGameOver = 0; %variable to show if the game is over, no=0 and yes=2

while (rounds<=totalrounds) && (IsGameOver==0)
    for Cplayer = 1:N %each player goes once in a round
        PlayerID = PlayerCell{Cplayer};
        turn_m = ', it is your turn. ';
        fprintf('%s %s',PlayerID,turn_m);
        playerok = input('Enter r when you are ready for your turn. ','s');
        if (playerok == 'r')
            [TaxedMoney,Players,Properties] = GamePlay(TaxedMoney,PlayerCell,BoardCell,Cplayer,Players,Properties,Property_Vec);
        end
        rounds = rounds+1;
    end
end
   
EndMatrix = EndGame(N,Properties,Players);

%display final rankingings
disp(PlayerCell);
disp('The players in the order above correspond to the numbers in the first row. ');
disp('This is the net worth of all players at the end of this game: ');
disp(EndMatrix)
disp('Thanks for playing. Come again soon! ');
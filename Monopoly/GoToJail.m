function  [Cplayer_pos,Players]=  GoToJail(Cplayer_pos,Players,Cplayer) 
if Players(2,Cplayer) == -1
		Cplayer_pos(1,Cplayer) = 16;
		Players(1,Cplayer) = 0;
	else
		Cplayer_pos(1,Cplayer) = 6;
		Players(1,Cplayer) = 1;
end
    
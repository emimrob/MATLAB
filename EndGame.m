function EndMatrix = EndGame(Z,Properties,Players)
for z = 1:Z %Z is the current number of players
    for y = 1:20
        if Properties(1,y) == z
            Players(3,z) = Players(3,z) + Properties(2,y);
            %adding the worth of each owned property to the amount of
            %money each player has
        end
    end
end
EndMatrix = zeros(2,Z);
disp(Players)
EndMatrix(1,:) = 1:1:Z;
EndMatrix(2,:) = Players(3,:);
[val,in] = max(Players(3,:));

str1 = 'Congratulations Player';
str2 = ', you won! You are worth';
str3 = 'dollars.';
fprintf('%s %d %s %d %s',str1,in,str2,val,str3)
end
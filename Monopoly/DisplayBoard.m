function DisplayBoard(PlayerCell,BoardCell,Cplayer,Players,Properties,Property_Vec)

%this function creates a display to represent where the players are on the
%board
num_players = length(PlayerCell);

%first draw the board. Treat it as a 60x60 so each place is a 10x10 square
f1=figure;

line([10,10],[0,60]);
hold on;
line([50,50],[0,60]);
hold on;
line([0,60],[10,10]);
hold on;
line([0,60],[50,50]);
hold on;
txt = 'UMN Monopoly!';
text(20,30,txt,'FontSize',16);

%draw in all of the properties, etc
rectangle('Position',[0,0,10,10],'FaceColor',[0.9 0.9 0.9],'EdgeColor','black','LineWidth',1);
text(3,5,'Go','FontSize',12);
rectangle('Position',[0,10,10,10],'FaceColor',[0.9 0.40 0.9],'EdgeColor','black','LineWidth',1);
text(1,16,'Biomed','FontSize',12);
text(1,13,'Library','FontSize',12);
rectangle('Position',[0,20,10,10],'FaceColor',[0.9 0.40 0.9],'EdgeColor','black','LineWidth',1);
text(1,27,'Lind','FontSize',12);
text(1,23,'Hall','FontSize',12);
rectangle('Position',[0,30,10,10],'FaceColor',[0.7 0.6 0.7],'EdgeColor','black','LineWidth',1);
text(0.5,36,'Community','FontSize',10);
text(1.5,34,'Chest','FontSize',10);
rectangle('Position',[0,40,10,10],'FaceColor',[0.9 0.40 0.9],'EdgeColor','black','LineWidth',1);
text(1,46,'Walter','FontSize',12);
text(1,43,'Library','FontSize',12);
rectangle('Position',[0,50,10,10],'FaceColor',[0.9 0.1 0.1],'EdgeColor','black','LineWidth',1);
text(3,55,'Jail','FontSize',12);
rectangle('Position',[10,50,10,10],'FaceColor',[0.1 0.9 0.1],'EdgeColor','black','LineWidth',1);
text(11,55,'Mech E','FontSize',12);
rectangle('Position',[20,50,10,10],'FaceColor',[0.1 0.9 0.1],'EdgeColor','black','LineWidth',1);
text(20.5,55,'Amundson','FontSize',10);
rectangle('Position',[30,50,10,10],'FaceColor',[0.1 0.9 0.1],'EdgeColor','black','LineWidth',1);
text(32,55,'Keller','FontSize',12);
rectangle('Position',[40,50,10,10],'FaceColor',[0.1 0.9 0.1],'EdgeColor','black','LineWidth',1);
text(43,55,'Tate','FontSize',12);
rectangle('Position',[50,50,10,10],'FaceColor',[0.5 0.5 0.9],'EdgeColor','black','LineWidth',1);
text(52,56,'Free','FontSize',12);
text(51,53,'Parking','FontSize',12);
rectangle('Position',[50,40,10,10],'FaceColor',[0.2 0.3 0.8],'EdgeColor','black','LineWidth',1);
text(52,45,'MCB','FontSize',14);
rectangle('Position',[50,30,10,10],'FaceColor',[0.2 0.3 0.8],'EdgeColor','black','LineWidth',1);
text(52,36,'Moos','FontSize',12);
text(52,33,'Tower','FontSize',12);
rectangle('Position',[50,20,10,10],'FaceColor',[0.5 0.3 0.7],'EdgeColor','black','LineWidth',1);
text(50.5,26,'Income','FontSize',11);
text(50.5,23,'Tax(10%)','FontSize',11);
rectangle('Position',[50,10,10,10],'FaceColor',[0.2 0.3 0.8],'EdgeColor','black','LineWidth',1);
text(52,16,'Nils','FontSize',11);
text(50.5,13,'Hasselmo','FontSize',11);
rectangle('Position',[50,0,10,10],'FaceColor',[0.7 0.3 0.5],'EdgeColor','black','LineWidth',1);
text(52,6,'Go To','FontSize',11);
text(53,3,'Jail!','FontSize',11);
rectangle('Position',[40,0,10,10],'FaceColor',[1 1 0.1],'EdgeColor','black','LineWidth',1);
text(42,6,'Rec','FontSize',12);
text(41,3,'Center','FontSize',12);
rectangle('Position',[30,0,10,10],'FaceColor',[1 1 0.1],'EdgeColor','black','LineWidth',1);
text(31,6,'Coffman','FontSize',12);
text(32,3,'Union','FontSize',12);
rectangle('Position',[20,0,10,10],'FaceColor',[1 1 0.1],'EdgeColor','black','LineWidth',1);
text(20.5,5,'Northrop','FontSize',12);
rectangle('Position',[10,0,10,10],'FaceColor',[1 1 0.1],'EdgeColor','black','LineWidth',1);
text(13,6,'TCF','FontSize',12);
text(11,3,'Stadium','FontSize',12);
hold on;


%vectors to connect indeces of all locations (linear representation) to the
%2D matrix on the board.

boardx = [2 2 2 2 2 2 12 22 32 42 52 52 52 52 52 52 42 32 22 12];
boardy = [8 18 28 38 48 58 58 58 58 58 58 48 38 28 18 8 8 8 8 8];

%now display all of the players in their present position
for i=1:num_players
    playname = PlayerCell{i};
    player_pos = Players(1,i);
    pp_x = boardx(player_pos);
    pp_y = boardy(player_pos);
    mychar = text(pp_x,pp_y,playname);
    mychar(1).Color = 'white';
    mychar(1).FontSize = 9;
    %text(pp_x,pp_y,playname,'Color','red''FontSize',12);
end
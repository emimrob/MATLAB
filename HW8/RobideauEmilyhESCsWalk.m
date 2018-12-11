% Author: Emily Robideau
% Collaborators: None
% Assignment: HW8 P8

% Part a

%5 micrometers/15 minutes, 15 minute steps
N = input('How many steps?');
pos = zeros(2,N); %row 1 is angles, row 2 is net displacement from zero
msd = 0;
X = rand();
fh = @(q) q/(2*pi)+0.02*sin(2*q)-X;
q = fzero(fh,0);
pos(1,1) = q;
pos(2,1) = 5;
for i = 2:N
    X = rand();
    fh = @(q) q/(2*pi)+0.02*sin(2*q)-X;
    q = fzero(fh,0);
    pos(1,i) = q;
    pos(2,i) = sqrt(25+(pos(2,i-1)^2)-(10*pos(2,i-1)*cos(pos(1,i)))); 
    msd = msd + pos(2,i)^2;
end
MSD = msd/N;
hist(pos(1,:));

% Part b

N = input('How many steps?');
pos = zeros(2,N); %row 1 is angles, row 2 is net displacement from zero
msd = 0;
X = rand();
fh = @(q) q/(2*pi)+0.075*sin(2*q)-X;
q = fzero(fh,0);
pos(1,1) = q;
pos(2,1) = 5;
for i = 2:N
    X = rand();
    fh = @(q) q/(2*pi)+0.075*sin(2*q)-X;
    q = fzero(fh,0);
    pos(1,i) = q;
    pos(2,i) = sqrt(25+(pos(2,i-1)^2)-(10*pos(2,i-1)*cos(pos(1,i)))); 
    msd = msd + pos(2,i)^2;
end
MSD = msd/N;
hist(pos(1,:));

% Part c a

N = input('How many steps?');
pos = zeros(2,N); %row 1 is angles, row 2 is net displacement from zero
msd = 0;
X = rand();
fh = @(q) q/(2*pi)+0.04*sin(q)-X;
q = fzero(fh,0);
pos(1,1) = q;
pos(2,1) = 5;
for i = 2:N
    X = rand();
    fh = @(q) q/(2*pi)+0.04*sin(q)-X;
    q = fzero(fh,0);
    pos(1,i) = q;
    pos(2,i) = sqrt(25+(pos(2,i-1)^2)-(10*pos(2,i-1)*cos(pos(1,i)))); 
    msd = msd + pos(2,i)^2;
end
MSD = msd/N;
hist(pos(1,:));

% Part c b

N = input('How many steps?');
pos = zeros(2,N); %row 1 is angles, row 2 is net displacement from zero
msd = 0;
X = rand();
fh = @(q) q/(2*pi)+0.075*sin(q)-X;
q = fzero(fh,0);
pos(1,1) = q;
pos(2,1) = 5;
for i = 2:N
    X = rand();
    fh = @(q) q/(2*pi)+0.075*sin(q)-X;
    q = fzero(fh,0);
    pos(1,i) = q;
    pos(2,i) = sqrt(25+(pos(2,i-1)^2)-(10*pos(2,i-1)*cos(pos(1,i)))); 
    msd = msd + pos(2,i)^2;
end
MSD = msd/N;
hist(pos(1,:));
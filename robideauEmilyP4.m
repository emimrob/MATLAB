% Emily Robideau, 9-24-18
hip=dlmread('GaitHip.txt','\t');
xold=hip(1:100,1);
xnew=hip(2:101,1);
v2=xnew-xold;
t(1:100,1)=(v2)./hip(1:100,2);
mean(t);
gcMu=mean(t)*100;
format long
A=[1 0 0 0;
    1000 2*(6000) 5000 0;
    0 5000 2*(10000) 5000;
    0 0 0 1]
b=[0; .01548; .00396; 0]
x=A\b
%%
format long
A=[1 1 0 0;
    0 1 1 0;
    0 0 1 1;
    0 0 0 1]
b=[-1.296*10^-2 -2.64*10^-3 0 0]'
x=A\b
%%
format long
%syms n sumx sumx2 sumx3 sumx4 sumy sumxy sumx2y
%A=[n sumx sumx2;
%    sumx sumx2 sumx3;
%    sumx2 sumx3 sumx4]
%b=[sumy sumxy sumx2y]'
A=[5 60 810;
    60 810 11880;
    810 11880 184194]
b=[367 4395 59049]'
x=A\b
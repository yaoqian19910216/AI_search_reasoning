%HW4.2 Qian Yao 

X=importdata('X.dat.txt');
Y=importdata('Y.dat.txt');
n=size(X,2);
T=size(X,1);
P=zeros(n,1)+0.2;
FID=fopen('cse_hw4_2_likelihoodtable', 'w+');
L=cse_hw4_2_L(X,Y,P,n,T);
fprintf(FID,'%-2.1f %-5.1f \n',0,L);
for iteration=1:64
    P=cse_hw4_2_P(X,Y,P,n,T);
    L=cse_hw4_2_L(X,Y,P,n,T);
    fprintf(FID,'%-2.1f %-5.1f \n',iteration,L);
end

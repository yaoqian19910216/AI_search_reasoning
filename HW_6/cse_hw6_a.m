%cse_hw6_a.m

iter = 10000;%number of iterations
state = 81;%number of states
V = zeros(state,1);%initialize value function
gama = 0.975;

[Pa1,Pa2,Pa3,Pa4,Rewards] = cse_hw6_load();%load the transition matrix
for i = 1:iter
    V = Rewards + gama*max([Pa1*V Pa2*V Pa3*V Pa4*V],[],2);
end
FID1 = fopen('valuefunction','w+');
FID2 = fopen('nonzerovaluefunction','w+');
FID3 = fopen('optimalpolicy','w+');
for i=1:state
        fprintf(FID1, '%d %d \n', i, V(i));
end
fclose(FID1);

for i=1:state
    if(V(i) ~= 0)
        fprintf(FID2, '%-5d %-5d \n', i, V(i));
    end
end
fclose(FID2);

[Y, PIE] = max([Pa1*V Pa2*V Pa3*V Pa4*V],[],2);
for i=1:state
    if(V(i) ~= 0)
        fprintf(FID3, '%-5d %-5d \n', i, PIE(i));
    end
end
fclose(FID3);



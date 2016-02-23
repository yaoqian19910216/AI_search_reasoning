function P=cse_hw4_2_P(X,Y,Pb,n,T)
%calculate the updated probability in each iteration
%n is the number of diseases, T is the number of samples(patients),Pb is
%the estimation of probability before update
P=Pb;
for i=1:n
    summation=0;
    for t=1:T
        product=1;
        for j=1:n
            product=product*(1-Pb(j))^(X(t,j));
        end
        summation=summation+Y(t)*X(t,i)*Pb(i)/(1-product);
    end
    P(i)=summation/sum(X(:,i));
end

        
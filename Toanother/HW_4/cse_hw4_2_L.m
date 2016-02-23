function L=cse_hw4_2_L(X,Y,P,n,T)
%calculate the log likelihoood in each iteration
%n=size(X,2);
%T=size(X,1);
L=0;
for t=1:T
    sum=0;
    product=1;
    for i=1:n
        sum=sum+X(t,i)*log(1-P(i));
    end
    for i=1:n
        product=product*(1-P(i))^(X(t,i));
    end
    L=L+(1-Y(t))*sum+Y(t)*log(1-product);
end
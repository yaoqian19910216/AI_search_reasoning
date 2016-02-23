beta1 <- seq(-1, 1, length.out = 11)
beta2 <- seq(-1,1, length.out = 11)
fconstrain <- function(beta1,beta2) abs(beta1) + abs(beta2)
z <- outer(beta1,beta2,fconstrain)
z
contour(outer(beta1,beta2,fconstrain))
contour(beta1,beta2,z,xlim = c(-1,1),ylim = c(-1,1),levels = c(1),color = "green")


install.packages("VGAM")
library(VGAM)
install.packages("MASS")
library(MASS)
beta1 <- seq(-1, 1, length.out = 11)
beta2 <- seq(-1,1, length.out = 11)
n = 50
p = 2
beta = rnorm(2,0,1)
eps = 0.1*rnorm(n,0,1)

mu = array(0,dim = c(p,1))
Segma = array(0,dim = c(p,p))
for(i in 1:p)
for(j in 1:p)
{
	Segma[i,j] = 0.5^abs(i-j)
}
X = mvrnorm(n,mu,Segma)
Y = X%*%beta + eps
floss <- function(beta1,beta2)
{
	sum = 0
	predicdiff = Y - X%*%c(beta1,beta2)
	for(i in 1:n)
	{
		sum = sum + predicdiff[i]
	}
	#sum = (Y - X%*%c(beta1,beta2))%*%(Y - X%*%c(beta1,beta2))
	sum
}
z <- outer(beta1,beta2,floss)
z
contour(outer(beta1,beta2,floss))

contour(beta1,beta2,z,xlim = c(-1,1),ylim = c(-1,1),levels = c(1),color = "green")
contour(beta1,beta2,z,xlim = c(-1,1),ylim = c(-1,1),levels = c(0.2,0.4,0.6,0.8),)

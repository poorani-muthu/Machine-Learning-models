
clear; 
close all; 
clc;

%Load Car Data

data=readtable('training.csv');

X=data.Var1; 
Y=data.Var2; 

N=size(Y,1);

X=[ones(N,1),X];

%initialize theta matrix
theta=zeros(2,1);

iterations = 10000;

%learning rate:
a= 0.1;

cost_fun=zeros(iterations,1);

for i=1:iterations

  h=(X*theta)-Y;

  theta(1)=theta(1)-(a/N)*h'*X(:,1);
  theta(2)=theta(2)-(a/N)*h'*X(:,2);
 
  %computing Cost
  cost_fun(i)=1/(2*N)*sum(h.^2);
  
end

fprintf('θ1 = %f θ2 = %f \n', theta(1), theta(2));

figure;
subplot(4,1,1)
plot(cost_fun(1:250));
xlabel("Total Iterations");
ylabel("Cost per iteration");
title("Minimisation of cost function using Gradient Descent");

subplot(4,1,[3,4])
N=X(:,2);
scatter(N,Y);
hold on;

L=theta(1)+theta(2)*linspace(1,5,1000);
n=linspace(1,5,1000);
plot(n,L,'r','LineWidth',1);
xlabel("Independent-Variable");
ylabel("Dependent-Variable");

title("Observed Vs Prediction data");

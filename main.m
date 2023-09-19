clear;
clc;

tic
tol=0.1; %tolerance
a=0; %lower bound
b=3;%upper bound
option=1;

%% fibonachi
%[optimum,x3]=fibb(a,b,tol,option);

%% golden
%[optimum,x3,i]=gold(a,b,option);

%% Quadratic Inter
A=0;
t0=0.5;
[L_star, fL_star, iterations]=Quad(A,t0,0,0,0);

%% Cubic
%[L_star, fL_star, iterations]=Cubic(A,t0,0,0,0);
toc
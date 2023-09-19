clc
clear

tic
%x1=[-1.2; 1]; % Rosen
x1=[3; -1;0;1]; %Powell
e1=0.01;
e = [6];

alpha=10^4;
c1=0.99;
c2=1.1;



%I=eye(2); %%rosen
I=eye(4); %%powell
i=1;
while e(i)>e1
    i=i+1
    r=1;
    while r
        %[fn1,G1,A1]= RosenFun(x1);
        [fn1,G1,A1]= Powell(x1);
        s1=-inv(A1+alpha*I)*G1;
        [L_star, fL_star, k] =Cubic(0,0.1,2,x1,s1);%%%% Cubic(A,t0,option,point, direction) 1=rosen, 2=powell
        L=L_star;
        
        x2 = x1 + L*s1;
        
        %[fn2,G2,A2]= RosenFun(x2);
        [fn2,G2,A2]= Powell(x2);
        
        if fn2 <fn1
            alpha=c1*alpha; %% compute gradiet
            r=0;
        else
            alpha=c2*alpha; %% get new x
            r=1;
        end
    end
    
    e(i) = G2'*G2;
    if e(i)<e1 %%|| (abs(e(i)-e(i-1))<0.01)
        break
    end
    x1 = x2;
end
f = fn1;
toc




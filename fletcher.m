clc
clear

tic
%x1=[-1.2; 1];% Rosen
x1=[3; -1;0;1]; %Powell
e1=0.1;
e = [6];
%[fn,G1,A1]= RosenFun(x1);
[fn,G1,A1]= Powell(x1);
s1=-G1;

i=1;
while  e(i)>e1 %%i<100
    i=i+1
    
        if rem(i,10)==0
            s1=-G1;
        end
    %% Rosen 
    L = -(s1'*G1)/(s1'*A1*s1);

    %% Powell
    %FL=@(L)((x1(1)+L*s1(1))+10*(x1(2)+L*s1(2)))^2 + 5*((x1(3)+L*s1(3))-(x1(4)+L*s1(4)))^2 +...
    %((x1(2)+L*s1(2))-2*(x1(3)+L*s1(3)))^4 + 10*((x1(1)+L*s1(1))-(x1(4)+L*s1(4)))^4; %%Powell
    %L= fminbnd(FL,-1000,1000);
    
    x2 = x1 + L*s1;
    
    %[fn,G2,A2]= RosenFun(x2);
    [fn,G2,A2]= Powell(x2);
    
    e(i) = G2'*G2;
    
    if e(i)<e1
        break
    end
    B2 = (G2'*G2)/(G1'*G1);
    s1 = - G2+B2*s1;
    x1 = x2;
    %[fn,G1,A1]= RosenFun(x1);
    [fn,G1,A1]= Powell(x1);
end
f = fn;
toc




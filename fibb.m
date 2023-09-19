
function [optimum,x3]=fibb(a,b,tol,option) % lower bound, upper bound tolerance
%option 1 minimize, 0 maximize
f=(b-a)/tol; %subintervls count

for i=1:100
    if fibonacci(i)>f
        r= fibonacci(i-1)/fibonacci(i);
        k=i;
        break
    end
end
while r>(1/2)
    x1= a+r*(b-a);
    x2= b-r*(b-a);
    switch option
        case 1 %minimize
            if fun(x1)< fun(x2)
                a=x1;
            else
                b=x2;
            end
            case 2 %maximize
            if fun(x1)> fun(x2)
                a=x2;
            else
                b=x1;
            end
    end
    
    x3=0.5*(x1+x2);
    optimum= fun(x3);
    k=k-1;
    r=fibonacci(k-1)/fibonacci(k);
end

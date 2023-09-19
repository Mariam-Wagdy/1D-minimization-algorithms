
function [optimum,x3,i]=gold(xl,xu,option) % lower bound, upper bound tolerance
%option 1 minimize, 0 maximize
i=0;
e=2;
while e>1%%%%%%%%%%%%%%%%%%%
    i=i+1;
    d=0.618*(xu-xl);
    x1= xl+d;
    x2= xu-d;
    switch option
        case 1 %minimize
            if fun(x1)< fun(x2)
                xl=x1;
            else
                xu=x2;
            end
            case 2 %maximize
            if fun(x1)> fun(x2)
                xl=x2;
            else
                xu=x1;
            end
    end
    
    x3=0.5*(x1+x2);
    optimum= fun(x3);
    e=(x1-x2)/x1*100
end

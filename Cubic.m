function[L_star, fL_star, i] =Cubic(A,t0,option,point, direction)
% option =0 use fun,
%        =1 use Rosen
%        =2 use powell

fdB=-1;

B=t0;
e=100;
e1=1;
i=1;

while (e>e1)
    fA = fun(A,option,point, direction); %fun(x, option,point,direction)
    fdA = derfun(A,option,point, direction);
    while fdB<0
        B = 2* B;
        fdB = derfun(B,option,point, direction);
    end
    
    
    fB=fun(B,option,point, direction); %fun(x, option,point,direction)
    
    DE =  (A-B)^2;
    Z  =  3*(fA-fB)/(B-A)+ fdA+ fdB;
    b  =  (B^2*fdA+A^2*fdB+2*A*B*Z)/DE;
    c  = -((A+B)*Z + B*fdA + A*fdB)/DE;
    d  =  (2*Z + fdA + fdB)/(3*DE);
    a = fA - b*A - c*A^2 - d*A^3;
    
    L1 = (-c + (c^2 - 3*b*d)^(1/2))/(3*d);
    L2 = (-c - (c^2 - 3*b*d)^(1/2))/(3*d);
    C1 = 2*c + 6*d*L1 >0;  %%=1 for minimum
    if C1
        L_star = L1;
    else
        L_star = L2;
    end
    if ~isreal(L_star)
        L_star=0;
    end
    
    hL_star = h3(a,b,c,d,L_star);
    fL_star = fun(L_star,option,point, direction); %fun(x, option,point,direction)
    fdL_star = derfun(L_star,option,point, direction);
    
    e = abs((hL_star-fL_star)/fL_star)*100;
    if(e>e1)
        i=i+1;
        if fdL_star<0
            A=L_star;
        else
            B=L_star;
        end
    end
end
end








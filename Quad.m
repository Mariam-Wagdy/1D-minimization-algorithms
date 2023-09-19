function [L_star, fL_star, refit]=Quad(A,t0,option,point, direction)

fA=fun(A,option,point, direction);


e=60;
e1=1; %%error in function values
i=0;
r=0;
refit=0;

while e>e1
    i=i+1;
    fA=fun(A,option,point, direction);
    f1=fun(t0,option,point, direction);
    if f1>fA
        fC=f1;
        C=t0;
        fB=fun(t0/2,option,point, direction);
        B=t0/2;
        
    else
        while r==0
            fB=f1;
            B=t0;
            f2=fun(2*t0,option,point, direction);
            if f1<f2
                fC=f2;
                C=2*t0;
                r=1;
            else
                f1=f2;
                t0=2*t0;
                r=0;
            end
        end
    end
    
    C2=((fA+fC)/2)>fB; %%concave
    DE=(A-B)*(B-C)*(C-A);
    
    while e>e1 %%C2 && (DE>0)
        
        DE=(A-B)*(B-C)*(C-A);
        p(i)=DE;
        a=(fA*B*C*(C-B)+fB*C*A*(A-C)+fC*A*B*(B-A))/DE;
        b=(fA*(B^2-C^2)+fB*(C^2-A^2)+fC*(A^2-B^2))/DE;
        c=-(fA*(B-C)+fB*(C-A)+fC*(A-B))/DE;
        
        %C1= c>0;
        L_star = -b/(2*c);
        hL_star = h2(a,b,c,L_star);
        fL_star=fun(L_star,option,point, direction);
        e = abs((hL_star-fL_star)/fL_star)*100;
        disp(e);
        if (e>e1) %%refit
            refit=refit+1;
            if (L_star > B) &&(fL_star < fB) %% neglect old A
                A=B;
                B=L_star;
            elseif (L_star > B) &&(fL_star > fB) %% neglect old C
                C=L_star;
            elseif (L_star < B) &&(fL_star < fB) %% neglect old C
                C=B;
                B=L_star;
            elseif (L_star < B) && (fL_star > fB) %% neglect old A
                A=L_star;
            end
        else
            break;
            
        end
    end
end
end
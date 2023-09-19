function u=fun(x, option,point,direction)
% option =0 use fun,
%        =1 use Rosen
%        =2 use powell
switch option
    case 0
        u=x^5-5*x^3-20*x+5;
    case 1 %%rosen
        X= point + x*direction;
        x=X(1);
        y=X(2);
        u= 100*(y-x^2)^2+(1-x)^2;
        
    case 2 %%powell
        X= point + x*direction;
        x=X(1);
        y=X(2);
        z=X(3);
        w=X(4);
        u = (x+10*y)^2 + 5*(z-w)^2 +(y-2*z)^4 + 10*(x-w)^4; %%Powell

end
end
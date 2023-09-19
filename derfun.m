function df = derfun(x, option,point, direction)
% option =0 use fun,
%        =1 use Rosen
%        =2 use powell
if x==0
    d=0.000001;
else
    d = x/1000;
end
df = (fun((x+d),option,point, direction)-fun((x-d),option,point, direction))/(2*d);

end

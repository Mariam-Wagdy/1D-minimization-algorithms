function [fn,G,A]= Powell(arr) %% function value, gradient, Hessian
syms x y z w

X=arr(1);
Y=arr(2);
Z=arr(3);
W=arr(4);

f = (x+10*y)^2 + 5*(z-w)^2 +(y-2*z)^4 + 10*(x-w)^4; %%powell
fn=subs(f,[x y z w],{X,Y,Z,W});
fn=double(fn);

s=gradient(f,[x y z w]);

G1 = subs(s(1),[x y z w],{X,Y,Z,W});
G2 = subs(s(2),[x y z w],{X,Y,Z,W});
G3 = subs(s(3),[x y z w],{X,Y,Z,W});
G4 = subs(s(4),[x y z w],{X,Y,Z,W});

g=[G1;G2;G3;G4];
G=double(g);

tempx=gradient(s(1),[x,y,z,w]);
tempy=gradient(s(2),[x,y,z,w]);
tempz=gradient(s(3),[x,y,z,w]);
tempw=gradient(s(4),[x,y,z,w]);

A11=subs(tempx(1),[x y z w],{X,Y,Z,W});
A12=subs(tempx(2),[x y z w],{X,Y,Z,W});
A13=subs(tempx(3),[x y z w],{X,Y,Z,W});
A14=subs(tempx(4),[x y z w],{X,Y,Z,W});

A22=subs(tempy(2),[x y z w],{X,Y,Z,W});
A23=subs(tempy(3),[x y z w],{X,Y,Z,W});
A24=subs(tempy(4),[x y z w],{X,Y,Z,W});

A33=subs(tempz(3),[x y z w],{X,Y,Z,W});
A34=subs(tempz(4),[x y z w],{X,Y,Z,W});

A44=subs(tempz(4),[x y z w],{X,Y,Z,W});

A=[ A11, A12, A13, A14;...
    A12 ,A22, A23, A24;...
    A13, A23, A33, A34;...
    A14, A24, A34 ,A44 ];
A= double (A);

end
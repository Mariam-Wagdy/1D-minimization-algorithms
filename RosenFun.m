function [fn,G,A]= RosenFun(arr) %% function value, gradient, Hessian
syms x y

X=arr(1);
Y=arr(2);

f = 100*(y-x^2)^2+(1-x)^2; %%Rosen
fn=subs(f,[x y],{X,Y});
fn=double(fn);

s=gradient(f,[x,y]);

G1 = subs(s(1),[x y],{X,Y});
G2 = subs(s(2),[x y],{X,Y});
g=[G1;G2];
G=double(g);

tempx=gradient(s(1),[x,y]);
A11=subs(tempx(1),[x y],{X,Y});
A12=subs(tempx(2),[x y],{X,Y});

tempy=gradient(s(2),[x,y]);
A22=subs(tempy(2),[x y],{X,Y});

A=[A11, A12; A12 ,A22];
A= double (A);

end
%% Power Series : 
%(1-x^2)*y''(x)-x*y'(x)+4y(x)=0, y(0)=0,y'(0)=1. Solve the ODE using power
%series method(upto 6 terms) and plot the solution using MATLAB
%Hint : Take x=0 as an ordinary point.
clc
syms y(x)
dy = diff(y,x,1);
l = (1-x^2)*(diff(y,x,2))-x*(diff(y,x,1))+4*y(x)==0;
cond = [y(0)==0;dy(0)==1];
sol = dsolve(l,cond)
%%
syms y(x) a
sum = 0;
for n = 1:6
    y(x) = (a*n*(n-1)*x^(n-2)) - (a*n*(n-1)*x^n) - (a*n*x) + 4*(a*x^n);
    sum = sum + y(x);
end
y(x) = sum;
y(x)
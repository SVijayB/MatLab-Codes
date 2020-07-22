%% Solving First-Order Differential Equation without initial conditions
syms y(x);
a = diff(y,x,1)==-5*y+6*x==0;
sol = dsolve(a)
%%  Solving First-Order Differential Equation with initial conditions
clc 
clear all
syms y(x);
a = diff(y,x,1)==-5*y+6*x==0;
sol = dsolve(a,y(0)==0)
%%  Solving Second-Order Differential Equation without initial conditions
% eqn => d^2y/dt^2 + 5*dy/dt + 6y = 0
clc
clear all
syms y(t)
a = diff(y,t,2)+5*diff(y,t,1)-6*y==0;
sol = dsolve(a)
%%  Solving Second-Order Differential Equation with initial conditions
% eqn => d^2y/dt^2 + 5*dy/dt + 6y = 0; y(0) = 0; y'(0) = 1;
clc
clear all
syms y(t)
dy = diff(y,t);
a = diff(y,t,2)+5*diff(y,t,1)-6*y==0;
cond = [y(0)==0;dy(0)==1];
sol = dsolve(a,cond)
%% Solve y''+2y'+y=0
clc 
clear all
syms y(t)
a = diff(y,t,2)+2*diff(y,t,1)+y==0;
sol = dsolve(a)
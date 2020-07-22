%%
%1) Solve the second order ODE y'''-9y''+15y'+25y = 0 by converting it into
%a system of linear ODE's : 
%Given y'''-9y''+15y'+25y = 0;
syms y(x);
[V,S] = odeToVectorField(diff(y,x,3)-9*(diff(y,x,2))+15*(diff(y,x,1))+25*y == 0)
%%
%2) Write the mathematical model of the given mass-sprint system and solve
%using matrix diagonalization method.
syms y(t) y1(t) y2(t);
a = [-2,1;1,-1];
[V,D] = eig(a)
[diff(y1,t,2);diff(y2,t,2)] == D*[y1;y2];
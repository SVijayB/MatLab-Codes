%Find Eigen values and Eigen vectors.
clc
clear all
a = [1,3,5;6,8,9;10,1,9]
[V,D] = eig(a)
pinv = inv(V);
p = V;
Diagonal = pinv*a*p

%%
clc
clear all
%Traffic flow : 
syms x1 x2 x3 x4
%At A:
eqn1 = x1 + x2 - 400 == 0;
%At B:
eqn2 = x1 + x4 - 100 == 0;
%At C:
eqn3 = x3 + x4 - 600 == 0;
%At D:
eqn4 = x2 - x3 + 1000 == 0;
sol = solve([eqn1,eqn2,eqn3,eqn4],[x1,x2,x3,x4]);
x1 = sol.x1
x2 = sol.x2
x3 = sol.x3
x4 = sol.x4

%%
clc
clear all
syms x1 x2 x3 x4
%At A: 
eqn1 = 30 - x1 - x2 == 0;
%At B:
eqn2 = x2 + x3 - 35 == 0;
%At C:
eqn3 = 45 - x3 == 0;
%At D:
eqn4 = x1 - 40 == 0;
sol = solve([eqn1,eqn2,eqn3,eqn4],[x1,x2,x3]);
x1 = sol.x1
x2 = sol.x2
x3 = sol.x3

%%
clc
clear all
syms x1 x2 x3 x4
%For H:
eqn1 = x1 - 3*x3 == 0;
%For Cl:
eqn2 = x1 - x4 == 0;
%For Na:
eqn3 = 3*x2 - x4 == 0;
%For P:
eqn4 = x2 - x3 == 0;
%For O:
eqn5 = 4*x2 - 4*x3 == 0;
sol = solve([eqn1,eqn2,eqn3,eqn4,eqn5],[x1,x2,x3,x4]);
x1 = sol.x1
x2 = sol.x2
x3 = sol.x3
x4 = sol.x4
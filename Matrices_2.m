%Solve X+Y+2Z = 3, X+2Y+Z=7 and 2Y+8Z=10;
syms X Y Z;
eqn1 = X+Y+2*Z == 3;
eqn2 = X+2*Y+Z == 7;
eqn3 = 2*Y + 8*Z == 10;
sol = solve([eqn1, eqn2, eqn3], [X, Y, Z]);
xSol = sol.X
ySol = sol.Y
zSol = sol.Z


z1 = @(X,Y) (X + Y - 3)/2; 
z2 = @(X,Y) (X + 2*Y - 7);
z3 = @(X,Y) (1/4*Y - 10/8);
fsurf(z1)
hold on
fsurf(z2)
fsurf(z3)
hold off



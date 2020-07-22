%A spring with a mass of 2 kg has natural length of 0.5m. A force of 25.6N
%is required to maintain it stretched to a length of 0.7m. If the spring is
%stretched to a length of 0.7m and then realesed with initial velocity 0,
%Find the position of the mass at any time t.
%Use Hook's law to find k(Sprint Constant).
%Find the mathematical model of the problem(Includes initial Condition).
%Convert the equation into system of linear ODE's.
%Solve the system using diagonalizaion method and write a MATLAB code.
clc;
k = (25.6)/(0.7-0.5)
%EQN = 2y''+128y = 0 => y''+64y = 0;
syms y(t) y1(t) y2(t);
a = 2*diff(y,t,2)+k*y==0;
m = [0,1;-k,0];
e = eig(m)
ode1 = diff(y1) == +11.3137i*y1;
ode2 = diff(y2) == -11.3137i*y2;
odes = [ode1; ode2];
S = dsolve(odes)
uSol(t) = S.y1
vSol(t) = S.y2
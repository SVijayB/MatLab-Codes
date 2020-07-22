%% Fourier Series : 
clc
syms t n f cs sn;
T0 = 2; w = pi;n = 1:5; 
a0 = (2/T0)*int(1,t,0,1)
an = (2/T0)*int(1*cos(1*w*t),t,0,1)
bn = (2/T0)*int(1*sin(1*w*t),t,0,1)
cs = cos(1*w*t)
sn = sin(1*w*t)
f = (a0/2)+(an*cs)+(bn*sn)
%%
% Write a MatLab code to find Fourier Series of the given function : 
clc
syms  t n x y f cs sn;
T0 = 2; w = pi;
a0 = (2/T0)*int(2*t,t,0,1);
for n = 1:5
    an = (2/T0)*int(2*t*cos(n*w*t),t,0,1);
    bn = (2/T0)*int(2*t*sin(n*w*t),t,0,1);
    cs = cos(n*w*t);
    sn = sin(n*w*t);
    x = (a0/2)+(an*cs)+(bn*sn);
    disp(x)
    av = (2/T0)*int(-2*t*cos(n*w*t),t,1,2);
    bv = (2/T0)*int(-2*t*sin(n*w*t),t,1,2);
    cs = cos(n*w*t);
    sn = sin(n*w*t);    
    y = (a0/2)+(av*cs)+(bv*sn);
    disp(y)
end

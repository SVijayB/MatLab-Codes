clc
x=normrnd(160,5,[100,1]);
s = zeros(1,5); 
a = zeros(1,5);
p = zeros(1,5);
for i=1:length(x)
    if (x(i) >= 150) && (x(i) < 155)
        s(1)=s(1)+1;
        a(1) = (150+155)/2;
    elseif (x(i) >= 155) && (x(i) < 160)
        s(2)=s(2)+1;
        a(2) = (155+160)/2;
    elseif (x(i) >= 160) && (x(i) < 165)
        s(3)=s(3)+1;    
        a(3) = (160+165)/2;
    elseif (x(i) >= 165) && (x(i) < 170)
        s(4)=s(4)+1;
        a(4) = (165+170)/2;
    elseif (x(i) >= 170) && (x(i) <= 175)
        s(5)=s(5)+1;
        a(5) = (170+175)/2;
    end
end
xl = {'150' '155' '160' '165' '170'};
xl = transpose(xl);
xu = {'155' '160' '165' '170' '175'};
xu = transpose(xu);
xi = {a(1) a(2) a(3) a(4) a(5)};
xi = transpose(xi);
f = {s(1) s(2) s(3) s(4) s(5)};
f = transpose(f);
T = table(xl,xu,f)
T2 = table(xi,f)
N = 0;
mean_x=0;
variance_x=0;
for i=1:5
    N = N + s(i);
end
for i=1:5
    p(i) = s(i)/N;
end
for i=1:5
    d = a(i)*p(i);
    mean_x=mean_x+d;
end
for i=1:5
    g = ((a(i)^2)*p(i));
    variance_x=variance_x+g;
end
mean_x
variance_x=variance_x-((mean_x)^2);
variance_x
bar(a,s)
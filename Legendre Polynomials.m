syms x c1 c2
y0(x) = legendreP(0,x)
y1(x) = legendreP(1,x)
y2(x) = legendreP(2,x)
y3(x) = legendreP(3,x)
y4(x) = legendreP(4,x)

fplot(legendreP(0:4, x))
axis([-2 2 -1 2])
ylabel('P_n(x)')
title('Legendre polynomials of degrees 0 through 4')
legend('0','1','2','3','4')

y(x) = c1*y1(x)+c2*y2(x)
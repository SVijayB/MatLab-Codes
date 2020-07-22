%Find Inverse of the matrix [1,2;5,6] without using inbuilt function;
m = [1,2;5,6]
a = m(1,1);
b = m(1,2);
c = m(2,1);
d = m(2,2);
det = a*d - b*c;
a1 = d;
b1 = -b;
c1 = -c;
d1 = a;
n = [a1,b1;c1,d1]

inv = n/det
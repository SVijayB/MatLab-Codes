%Matrices%

clc
clear all

A = rand(5,4);
B = rand(4,4);

C = A*B
C(1,3)=2
C(2,:) = [1,2,3,4]
C(:,3) = [10,20,30,40,50]

D = linspace(1,100,10)
E = linspace(1,100,20)
F = linspace(1,100,100)
G = linspace(1,100,200)

X = D.^2;
plot(D,X,'-x')

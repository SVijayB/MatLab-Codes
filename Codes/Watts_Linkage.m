clc; 
clear all;
%Parameters
%simulation range=8
%For starters try [3 1 3 6]
A = input('Enter length of crank: '); %crank 
B = input('Enter length of coupler(shortest link): '); %coupler
C = input('Enter length of follower: '); %follower=crank
D = input('Enter length of fixed link(longest link): '); %fixed link
R1=D/A;
R2=C/A;
flag1=1;
flag2=0;
if D>=A+B+C 
    disp('Mechanism does not exist')
    flag1=0;
end
if ((B+D)-(A+C))>3
    disp('Mechanism goes imaginary')
    flag1=0;
end
if R1+R2<2
    disp('Watts Linkage criterion is not feasible')
    flag1=0;
end

if flag1==1 && B+D>A+B
    disp('It follows triple rocker mechanism')
    flag2=1;
end
if flag2==1
t = 0:0.05:10; %time you need to simulate for
%code for sampling theta
theta=zeros(1,length(t));
m=acos((D^2+A^2-(C+B)^2)/(2*D*A)); %limit theta for which linkage wont become imaginary
a=linspace(0,m,7);
b=linspace(0,-m,7); %negative cycle
x = 1;
y = 0;
z = -6;
for i=0:13
    if(rem(i,2)==0)
        theta(z+7:y+7)=a;
        z = z+7;
        y = y+7;
        theta((z+7):(y+7)) = flip(a);
        z = z+7;
        y = y+7;
    elseif(rem(i,2)~=0)
        theta(z+7:y+7)=b;
        z = z+7;
        y = y+7;
        theta((z+7):(y+7)) = flip(b);
        z = z+7;
        y = y+7;
    x = x+1;
    end
end
%initialising link joints wrt coordinate system
P1 = [0;0]; %coordinates of intersection of crank and fixed link
P2 = A*[cos(theta); sin(theta)]; %coordinates of intersection of crank and coupler
E = sqrt(A^2 + D^2 - 2*A*D*cos(theta)); %resultant between A & D(crank & fixed link)
alfa = asin(A*sin(theta)./E); %angle between E and A
beta = acos((E.^2 + C^2 - B^2)./(2*E*C)); %angle between E and C(follower)
P3 = [D - C*cos(alfa+beta); C*sin(alfa+beta)]; %coordinates of intersection of follower and coupler
P4 = D*[1;0]; %coordinates of intersection of follower and fixed link
P3_x = P3(1,:); %x coordinate of P3 vector
P3_y = P3(2,:); %y coordinate of P3 vector
P3_vx = diff(P3_x)./diff(t); %x coordinate of P3 velocity vector
P3_vy = diff(P3_y)./diff(t); %y coordinate of P3 velocity vector
P3_v = sqrt(P3_vx.^2 + P3_vy.^2); %magnitude of P3 velocity
P3_ax = diff(diff(P3_x)./diff(t)); %x coordinate of P3 acceleration vector
P3_ay =diff( diff(P3_y)./diff(t)); %y coordinate of P3 acceleration vector
P3_a = sqrt(P3_ax.^2 + P3_ay.^2); %magnitude of P3 acceleration
for i=1:length(t);
   ani = subplot(3,1,1);
   %viscircles draws circles with specified centers and radii onto the current axes
   P1_circle = viscircles(P1',0.05);
   P2_circle = viscircles(P2(:,i)',0.05);
   P3_circle = viscircles(P3(:,i)',0.05);
   P4_circle = viscircles(P4',0.05);
   %plots a line in the current axes using the data in vectors x and y
   A_bar = line([P1(1) P2(1,i)],[P1(2) P2(2,i)]);
   B_bar = line([P2(1,i) P3(1,i)],[P2(2,i) P3(2,i)]);
   C_bar = line([P3(1,i) P4(1)],[P3(2,i) P4(2)]);   
   axis(ani,'equal');
   set(gca,'XLim',[-5 8],'YLim',[-2 7]);   
   str1 = 'P3';
   str2 = ['Time elapsed: '  num2str(t(i)) ' s'];
   P3_text = text(P3(1,i),P3(2,i)+0.4,str1);
   Time = text(-2,6,str2);
   pause(0.005);
   if i<length(t)
    %stops simulation
    delete(P1_circle);
    delete(P2_circle);
    delete(P3_circle);
    delete(P4_circle);
    delete(A_bar);
    delete(B_bar);
    delete(C_bar);
    delete(P3_text);
    delete(Time);
    %plots the velocity-time graph of P3
    vel = subplot(3,1,2);
    plot(vel,t(1:i),P3_v(1:i));
    set(vel,'XLim',[0 10],'YLim',[0 10]);
    xlabel(vel, 'Time (s)');
    ylabel(vel, 'Amplitude (m/s)');
    title(vel,'Velocity of P3');
    grid on;
    %plots the acceleration-time graph of P3
    acc = subplot(3,1,3);
    plot(acc,t(1:i-2),P3_a(1:i-2));
    set(acc,'XLim',[0 10],'YLim',[0 10]);
    xlabel(acc, 'Time (s)');
    ylabel(acc, 'Amplitude (m/s^2)');
    title(acc,'Acceleration of P3');
    grid on;
   end
end
P3_p=sqrt(P3_x.^2 + P3_y.^2); %resultant of positiona vectors
%plots for positions
figure
for i=0:length(P3_p)
    if i<length(t)
    pos=subplot(2,1,2);
    plot(pos,t(1:i),P3_p(1:i));
    set(pos,'XLim',[0 10],'YLim',[0 10]);
    xlabel(pos, 'Time (s)');
    ylabel(pos, 'Distance from origin');
    title(pos,'Distance from orgin of P3');
    end
end
subplot(2,1,1)
plot(P3_x,P3_y);
Qa=input('enter the time you want to view the vel/acc: ')
velocity=P3_v(20*Qa)
acceleration=P3_a(20*Qa)
end
% theta=zeros(1,201);
% a=[0 0.1 0.2 0.3 0.4 0.5 0.6];
% b=[0 -0.1 -0.2 -0.3 -0.4 -0.5 -0.6];
% theta(1:7)=a;
% theta(8:14)=flip(a);
% theta(15:21)=b;
% theta(22:28)=flip(b);
% theta(29:35)=a;
% theta(36:42)=flip(a);
% theta(43:49)=b;
% theta(50:56)=flip(b);
% theta(57:63)=a;
% theta(64:70)=flip(a);
% theta(71:77)=b;
% theta(78:84)=flip(b);
% theta(85:91)=a;
% theta(92:98)=flip(a);
% theta(99:105)=b;
% theta(106:112)=flip(b);
% theta(113:119)=a;
% theta(120:126)=flip(a);
% theta(127:133)=b;
% theta(134:140)=flip(b);
% theta(141:147)=a;
% theta(148:154)=flip(a);
% theta(155:161)=b;
% theta(162:168)=flip(b);
% theta(169:175)=a;
% theta(176:182)=flip(a);
% theta(183:189)=b;
% theta(190:196)=flip(b);
% theta(197:201)=[0 0.1 0.2 0.3 0.4];

% Automate above code for mechanical linkage between two kinetic pairs for wattslinkage
theta=zeros(1,201);
a=[0 0.1 0.2 0.3 0.4 0.5 0.6];
b=[0 -0.1 -0.2 -0.3 -0.4 -0.5 -0.6];
x = 1
y = 0
z = -6
for i=0:28
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
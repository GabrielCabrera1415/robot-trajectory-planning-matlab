clc
clear all
close all



T06=T06(-pi/3,pi/3,3.5,pi/2,pi/6,pi/4)

syms q1 
l1a=8; l1b=3.5; l2=3; l4=1; l5=1; l6=1;
dx=T06(1,4); dy=T06(2,4); dz=T06(3,4);
z1=T06(1,3); z2=T06(2,3); z3=T06(3,3);
%C.I.P
d3x=dx-(z1*(l5+l6));
d3y=dy-(z2*(l5+l6));
d3z=dz-(z3*(l5+l6));
d1=d3x^2;
d2=d3y^2;

q3=l1a-l4-d3z;
q2=asin((d1+d2-(l2^2)-(l1b^2))/(2*l2*l1b));


eqn= (l2*cos(q1+q2))-(l1b*sin(q1))==d3y;
sq11=solve(eqn,q1,'Real',true);
eqn1=(-l2*sin(q1+q2))-(l1b*cos(q1))==d3x;
sq12=solve(eqn1,q1,'Real',true);
q11=double(sq11)
q12=double(sq12)

if round(q11(1,1),4)==round(q12(1,1),4)
    q1=q11(1,1);
elseif round(q11(2,1),4)==round(q12(1,1),4)
    q1=q11(2,1);

elseif round(q11(1,1),4)==round(q12(2,1),4)
    q1=q11(1,1);

elseif round(q11(2,1),4)==round(q12(2,1),4)
    q1=q11(2,1);
else
    q1=q11(2,1);
end

A1 = [ cos(q1), -sin(q1), 0, -l1b*cos(q1);
       sin(q1),  cos(q1), 0, -l1b*sin(q1);
       0,        0, 1,          l1a;
       0,        0, 0,            1];
 
A2 =[  sin(q2), -cos(q2),  0, -l2*sin(q2);
      -cos(q2), -sin(q2),  0,  l2*cos(q2);
        0,        0, -1,           0;
        0,        0,  0,           1];
 
A3 =[  0, 1, 0,       0;
     -1, 0, 0,       0;
      0, 0, 1, l4 + q3;
      0, 0, 0,       1];

 

T03=A1*A2*A3;
R03=T03(1:3,1:3);

%C.I.O
R06=T06(1:3,1:3);
R36=R03'*R06;  

q4=atan2(R36(2,3),R36(1,3));
q5=asin(-R36(3,3));
q6=atan2(-R36(3,2),R36(3,1));

q=[q1 q2 q3 q4 q5 q6]
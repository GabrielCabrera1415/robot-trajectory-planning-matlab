 clc
 clear all
 close all
 
 syms l1a l1b l2 l4 l5 l6
 syms q1 q2 q3 q4 q5 q6
A1 = [ cos(q1), -sin(q1), 0, -l1b*cos(q1);
       sin(q1),  cos(q1), 0, -l1b*sin(q1);
       0,        0, 1,          l1a;
       0,        0, 0,            1]
 
 
A2 =[  sin(q2), -cos(q2),  0, -l2*sin(q2);
      -cos(q2), -sin(q2),  0,  l2*cos(q2);
        0,        0, -1,           0;
        0,        0,  0,           1]
 
 
A3 =[  0, 1, 0,       0;
     -1, 0, 0,       0;
      0, 0, 1, l4 + q3;
      0, 0, 0,       1]

 
A4 =[cos(q4) 0 -sin(q4)  0;
    sin(q4)  0  cos(q4)  0;
       0     -1       0  0;
       0     0        0  1];
 
 
A5 =[ -sin(q5), 0, cos(q5), 0;
     cos(q5), 0, sin(q5), 0;
            0, 1,       0, 0;
            0, 0,       0, 1]
 
 
A6 =[ cos(q6), -sin(q6), 0,       0;
 sin(q6),  cos(q6), 0,       0;
       0,        0, 1, l5 + l6;
       0,        0, 0,       1]
 
   
    
% T01 = A1
% T02 = A1*A2
% T03 = simplify(A1*A2*A3)
% T04 = A1*A2*A3*A4
% T05 = A1*A2*A3*A4*A5
% T06 = A1*A2*A3*A4*A5*A6
%  
% T36 = simplify(A4*A5*A6)
%  
% T06 =simplify(T03*T36)

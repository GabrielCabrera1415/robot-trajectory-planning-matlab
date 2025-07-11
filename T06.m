function mat= T06(q1,q2,q3,q4,q5,q6)
l1a=8; l1b=3.5; l2=3; l4=1; l5=1; l6=1;
DH = [[q1,l1a,-l1b,0];...
      [q2-(pi/2),0,-l2,pi];...
      [-pi/2,q3+l4,0,0];...
      [q4,0,0,-pi/2];...
      [q5+pi/2,0,0,pi/2];...
      [q6,l5+l6,0,0]];
 
A1 = D_H(DH(1,:));
A2 = D_H(DH(2,:));
A3 = D_H(DH(3,:));
A4 = D_H(DH(4,:));
A5 = D_H(DH(5,:));
A6 = D_H(DH(6,:));
 
%ECUACIONES DE CINEMÁTICA DIRECTA

T03=A1*A2*A3;
T36=A4*A5*A6;
T06=T03*T36;
mat=T06;
clc
clear all
close all
 
%==Cinematica directa 
syms q1 q2 q3 q4 q5 q6 l1a l1b l2 l4 l5 l6
 
%      the  d   a  alpha
DH = [[q1,l1a,-l1b,0];...
      [q2-(pi/2),0,-l2,pi];...
      [-pi/2,q3+l4,0,0];...
      [q4,0,0,-pi/2];...
      [q5+pi/2,0,0,pi/2];...
      [q6,l5+l6,0,0]];
 
A1 = simplify( D_H(DH(1,:)) )
A2 = simplify( D_H(DH(2,:)) )
A3 = simplify( D_H(DH(3,:)) )
A4 = simplify( D_H(DH(4,:)) )
A5 = simplify( D_H(DH(5,:)) )
A6 = simplify( D_H(DH(6,:)) )
 
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
 
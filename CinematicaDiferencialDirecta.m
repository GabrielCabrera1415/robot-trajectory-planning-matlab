clc
clear all
close all

syms q1 q2 q3 q4 q5 q6 l1a l1b l2 l4 l5 l6

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
 
T01 = A1;
T02 = A1*A2;
T03 = simplify(A1*A2*A3);
T04 = A1*A2*A3*A4;
T05 = A1*A2*A3*A4*A5;
% T06 = A1*A2*A3*A4*A5*A6;
 
T36 = simplify(A4*A5*A6);
 
T06 =simplify(T03*T36);
%%Cinemática Diferencial Proyecto

%Es necesario correr ANTES Cinematica Directa
%R R P R R R

d06=T06(1:3,4);
%Para la primer unión R
z00=[0 0 1]';
up1=cross(z00,d06);
dw1=z00;

%Segunda unión R
z01=T01(1:3,3);
d01=T01(1:3,4);
up2=cross(z01,d06-d01);
dw2=z01;

%Tercera union P
z02=T02(1:3,3);
up3=z02;
dw3=[0 0 0]';

%Cuarta union R
z03=T03(1:3,3);
d03=T03(1:3,4);
up4=cross(z03,d06-d03);
dw4=z03;

%Quinta Unión R
z04=T04(1:3,3);
d04=T04(1:3,4);
up5=cross(z04,d06-d04);
dw5=z04;

%Sexta Unión R
z05=T05(1:3,3);
d05=T05(1:3,4);
up6=cross(z05,d06-d05);
dw6=z05;

J=[up1 up2 up3 up4 up5 up6; ...
   dw1 dw2 dw3 dw4 dw5 dw6];
J=simplify(J)

%Desacople de Singularidades Proyecto
%Desacoplamiento de singularidades
J11 = J(1:3,1:3);
J22 = J(4:6,4:6);

%==Singularidades del brazo 
dJ11 = simplify(det(J11));

eq1= dJ11 == 0;
Jq11=solve(eq1,[q2,q4,q5],"Real",true,"ReturnConditions",true);

Jq11.q2
Jq11.q4
Jq11.q5


%==Singularidades de la muñeca
dJ22 = simplify(det(J22));

eq2= dJ22 == 0;
Jq22=solve(eq2,q5,"Real",true);

Jq22


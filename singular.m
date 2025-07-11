function sing = singular(q)
q1=q(1);
q2=q(2);
q3=q(3);
q4=q(4);
q5=q(5);
q6=q(6);
CD=cindir(q);
T01=CD(:,:,1);
T02=CD(:,:,2);
T03=CD(:,:,3);
T04=CD(:,:,4);
T05=CD(:,:,5);
T06=CD(:,:,6);


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

%Desacople de Singularidades Proyecto
%Desacoplamiento de singularidades
J11 = J(1:3,1:3);
J22 = J(4:6,4:6);

% %==Singularidades del brazo 
  dJ11 = round(det(J11));
% 
% eq1= dJ11 == 0;
% Jq11=solve(eq1,[q2,q4,q5],"Real",true,"ReturnConditions",true);
% 
% Jq11.q2;
% Jq11.q4;
% Jq11.q5;
% 
% 

% %==Singularidades de la muñeca
  dJ22 =round(det(J22));
% 
% eq2= dJ22 == 0;
% Jq22=solve(eq2,q5,"Real",true);

% Jq22;

if dJ11==0||dJ22==0
   bandera=1;
    
else
   bandera=0;
end

sing=bandera;
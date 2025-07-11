
clc
clear all
close all
% Robot Proyecto de 6GDL
% Valores constantes
l1a=8; l1b=3.5; l2=3; l4=1; l5=1; l6=1;

%         theta d a alpha 1-0 OFF
L(1)=Link([0,l1a,-l1b,0]);
L(2)=Link([0,0,-l2,pi,0,-pi/2]);
L(3)=Link([-pi/2,0,0,0,1,l4]);
L(4)=Link([0,0,0,-pi/2]);
L(5)=Link([0,0,0,pi/2,0,pi/2]);
L(6)=Link([0,l5+l6,0,0,0,0]);

qli=[-pi pi;-pi pi;0 4;-pi pi;-pi pi;-pi pi];
qz=[0 0 0 0 0 0];

rpp1=SerialLink(L,'name','Robot Tipo SCARA','qlim',qli); %construcción del objeto polar, 
rpp1.plotopt = {'workspace', [-7 7 -7 7 -0.8 10]};

%% graficar 

% axis([-5 5 -5 5 -5 5])
to6=T06(-2*pi/3,pi/2,4,-pi/5,-pi,-pi/9)
d=to6([1:3],4)'%posicion deseada
q=cininv(to6)%cinemática inversa
dd1=interp5(0,0,0,q(1),0,0,0,1); %interp5(q0,v0,ac0,q1,v1,ac1,t0,tf)%articulación 1
dd2=interp5(0,0,0,q(2),0,0,0,1); %interp5(q0,v0,ac0,q1,v1,ac1,t0,tf)%articulación 2
dd3=interp5(0,0,0,q(3),0,0,0,1); %interp5(q0,v0,ac0,q1,v1,ac1,t0,tf)%articulación 3
dd4=interp5(0,0,0,q(4),0,0,0,1); %interp5(q0,v0,ac0,q1,v1,ac1,t0,tf)%articulación 4
dd5=interp5(0,0,0,q(5),0,0,0,1); %interp5(q0,v0,ac0,q1,v1,ac1,t0,tf)%articulación 5
dd6=interp5(0,0,0,q(6),0,0,0,1); %interp5(q0,v0,ac0,q1,v1,ac1,t0,tf)%articulación 6
[x,y,z]=sphere(30);
surf(x+d(1),y+d(2),z+d(3))
% plot3(d(1),d(2),d(3),'r*')
%% 
rpp1.plot([dd1(:,1),dd2(:,1),dd3(:,1),dd4(:,1),dd5(:,1),dd6(:,1)])
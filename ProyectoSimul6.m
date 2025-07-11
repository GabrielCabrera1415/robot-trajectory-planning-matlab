
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
rpp1.plotopt = {'workspace', [-9 9 -9 9 -0.8 10]};

%% graficar 


to6(:,:,1)=T06(0,0,0,0,0,0)
to6(:,:,2)=T06(-2*pi/3,pi/2,4,-pi/5,-pi,-pi/9)
to6(:,:,3)=T06(2*pi/3,pi/2,1,pi/5,pi,pi/9)

q(:,1)=[0;0;0;0;0;0]


for i=1:2
    d(:,i+1)=to6([1:3],4,i+1)'%posicion deseada
    q(:,i+1)=cininv(to6(:,:,i+1))%cinemática inversa
end



for i=1:2
    dd1(:,:,i)=interp5(q(1,i),0,0,q(1,i+1),0,0,0,1); %interp5(q0,v0,ac0,q1,v1,ac1,t0,tf)%articulación 1
    dd2(:,:,i)=interp5(q(2,i),0,0,q(2,i+1),0,0,0,1); %interp5(q0,v0,ac0,q1,v1,ac1,t0,tf)%articulación 2
    dd3(:,:,i)=interp5(q(3,i),0,0,q(3,i+1),0,0,0,1); %interp5(q0,v0,ac0,q1,v1,ac1,t0,tf)%articulación 3
    dd4(:,:,i)=interp5(q(4,i),0,0,q(4,i+1),0,0,0,1); %interp5(q0,v0,ac0,q1,v1,ac1,t0,tf)%articulación 4
    dd5(:,:,i)=interp5(q(5,i),0,0,q(5,i+1),0,0,0,1); %interp5(q0,v0,ac0,q1,v1,ac1,t0,tf)%articulación 5
    dd6(:,:,i)=interp5(q(6,i),0,0,q(6,i+1),0,0,0,1); %interp5(q0,v0,ac0,q1,v1,ac1,t0,tf)%articulación 6
end

[x,y,z]=sphere(30);
hold on
surf(x+d(1,2),y+d(2,2),z+d(3,2))
surf(x+d(1,3),y+d(2,3),z+d(3,3))

% plot3(d(1),d(2),d(3),'r*')
%% 
for i=1:2
axis([-9 9 -9 9 -0.8 10])
rpp1.plot([dd1(:,1,i),dd2(:,1,i),dd3(:,1,i),dd4(:,1,i),dd5(:,1,i),dd6(:,1,i)])
end

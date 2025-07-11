
clc
clear all
close all
% Robot Proyecto de 6GDL
% Valores constantes
l1a=16; l1b=9; l2=9; l4=1; l5=1; l6=1;

%         theta d a alpha 1-0 OFF
L(1)=Link([0,l1a,-l1b,0]);
L(2)=Link([0,0,-l2,pi,0,-pi/2]);
L(3)=Link([-pi/2,0,0,0,1,l4]);
L(4)=Link([0,0,0,-pi/2]);
L(5)=Link([0,0,0,pi/2,0,pi/2]);
L(6)=Link([0,l5+l6,0,0,0,0]);

qli=[-pi pi;-3 3;0 6;-3 3;-3 3;-3 3];
qz=[pi 0 0 0 0 0];

rpp1=SerialLink(L,'name','Robot Tipo SCARA','qlim',qli); %construcción del objeto polar, 
rpp1.plotopt = {'workspace', [-19 19 -19 19 -1 19]};

%% Generación de Trayectorias
load('trayectoria.mat');
[b,n,m]=size(Txx);
for i=1:201
Txx(:,:,i)=[Txx(1,1,i) Txx(1,2,i) Txx(1,3,i) Txx(1,4,i)+5;
            Txx(2,1,i) Txx(2,2,i) Txx(2,3,i) Txx(2,4,i)+5;
            Txx(3,1,i) Txx(3,2,i) Txx(3,3,i) Txx(3,4,i);
            Txx(4,1,i) Txx(4,2,i) Txx(4,3,i) Txx(4,4,i)];
end
q(:,1)=[0;0;0;0;0;0];


for i=1:m-1
    d(:,i+1)=Txx([1:3],4,i+1)';%posicion deseada
    q(:,i+1)=cininv(Txx(:,:,i+1));%cinemática inversa
end

[n,k]=size(q);

for i=1:k
sing(i)=singular(q(:,i));
end

u=0;
if sing(:)==zeros(1,length(sing))
    fprintf('No hay ninguna singularidad\n')
    q=q ;
else
     for i=1:m
           if sing(i)==1
             fprintf('En la posición: ')
             fprintf('%d ',i)
             fprintf('hay una singularidad, se omitirán estos valores de GDL\n\n') 
             u=u+1;
             val(u)=i;  
           end
     end     
   q(:,val(:))=[];   
end

[n,m]=size(q);

%interpolaciones(q0,v0,ac0,q1,v1,ac1,t0,tf,v,pasos,ele)
%ele=1 (LSPB), ele=2 (pol grado 3),ele=3 (pol grado 5)
%(t0,q0,tf,q1,v,pasos) para LSPB
%(q0,v0,q1,v1,t0,tf) para pol grado 3
%(q0,v0,ac0,q1,v1,ac1) para pol grado 5
for i=1:m-1
    dd1(:,:,i)=interpola(q(1,i),0,0,q(1,i+1),0,0,0,0.05,1,0.01,3); %articulación 1
    dd2(:,:,i)=interpola(q(2,i),0,0,q(2,i+1),0,0,0,0.05,1,0.01,3); %articulación 2
    dd3(:,:,i)=interpola(q(3,i),0,0,q(3,i+1),0,0,0,0.05,1,0.01,3); %articulación 3
    dd4(:,:,i)=interpola(q(4,i),0,0,q(4,i+1),0,0,0,0.05,1,0.01,3); %articulación 4
    dd5(:,:,i)=interpola(q(5,i),0,0,q(5,i+1),0,0,0,0.05,1,0.01,3); %articulación 5
    dd6(:,:,i)=interpola(q(6,i),0,0,q(6,i+1),0,0,0,0.05,1,0.01,3); %articulación 6
end

%% Simulación
close all
title('Logo de UPIITA')
for i=1:m-1
rpp1.plot([dd1(:,1,i),dd2(:,1,i),dd3(:,1,i),dd4(:,1,i),dd5(:,1,i),dd6(:,1,i)],'trail', 'k.')
end
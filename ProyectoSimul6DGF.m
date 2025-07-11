
clc
clear all
close all

%% Robot Proyecto de 6GDL
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

rpp=SerialLink(L,'name','Robot Tipo SCARA','qlim',qli); %construcción del objeto polar, 
figure,rpp.plotopt = {'workspace', [-10 10 -10 10 -0.8 10]};
rpp.teach(qz)

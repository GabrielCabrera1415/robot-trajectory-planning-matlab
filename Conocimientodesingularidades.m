
clc
clear all
close all

q(:,1)=[0;0;0;0;pi/2;0];
q(:,2)=[pi;pi/3;2;pi/4;pi/2;0];
q(:,3)=[pi;pi/3;2;pi/4;-pi/2;0];
q(:,4)=[-pi;-pi/3;2;pi/4;pi/4;0];
q(:,5)=[pi;pi;2;pi/4;pi/2;0];
q(:,6)=[pi;pi;2;pi/4;0;0];
[n,m]=size(q);
q

for i=1:m
sing(i)=singular(q(:,i));
end

u=0;
if sing(:)==zeros(1,length(sing))
    fprintf('No hay ninguna singularidad\n')
    q=q;
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
q
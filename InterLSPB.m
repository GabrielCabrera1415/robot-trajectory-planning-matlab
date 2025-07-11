function d = InterLSPB(t0,q0,tf,q1,v,pasos)
tb = (q0-q1+v*tf)/tf;
alfa = v/tb;

t = t0:pasos:tf;

q=zeros(1,length(t));

tm = size(t);
if ( ((q1-q0)/tf)<v && v<=(2*(q1-q0)/tf) )
    for i=1:tm(2)
        if (t(i)>=0 && t(i)<=tb)            
            q(i)=q0+(alfa/2)*t(i)^2;   
        elseif (tb<t(i) && t(i)<=(tf-tb))
            q(i)=v*t(i)+((q1+q0-v*tf)/2);                    
        elseif ((tf-tb)<t(i) && t(i)<=tf)
            q(i)=q1-((alfa*tf^2)/2)+(alfa*tf*t(i))-((alfa*t(i)^2)/2);            
        end
    end
else
    fprintf('No cumple condiciones\n')
end

d=[q;t;t]';

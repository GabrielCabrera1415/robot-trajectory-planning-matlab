function q=interpolaciones(q0,v0,ac0,q1,v1,ac1,t0,tf,v,pasos,ele)

switch(ele)
    case 1
q=InterLSPB(t0,q0,tf,qf,v,pasos)
    case 2
q=interp3(q0,v0,q1,v1,t0,tf)
    case 3
q=interp5(q0,v0,ac0,q1,v1,ac1,t0,tf)
    otherwise
q=interp5(q0,v0,ac0,q1,v1,ac1,t0,tf)
end

end
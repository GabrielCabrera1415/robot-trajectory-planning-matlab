function d = interp3(q0,v0,q1,v1,t0,tf)

t = t0:0.01:tf;
c = ones(size(t));
M = [ 1 t0 t0^2 t0^3;
0 1 2*t0 3*t0^2;
1 tf tf^2 tf^3;
0 1 2*tf 3*tf^2];
%
b=[q0; v0; q1; v1];
a = inv(M)*b;
%
% qd = position trajectory
% vd = velocity trajectory
%
qd = a(1).*c + a(2).*t +a(3).*t.^2 + a(4).*t.^3;
vd = a(2).*c +2*a(3).*t +3*a(4).*t.^2;
d=[qd;vd;t]';
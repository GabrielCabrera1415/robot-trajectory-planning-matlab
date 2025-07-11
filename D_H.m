
function r = D_H (in)
    t = in(1);
    d = in(2);
    a = in(3);
    alf = in(4);
    r = [[C(t),-C(alf)*S(t),S(alf)*S(t),a*C(t)];...
         [S(t),C(alf)*C(t),-S(alf)*C(t),a*S(t)];...
         [0,S(alf),C(alf),d];...
         [0,0,0,1]];
end

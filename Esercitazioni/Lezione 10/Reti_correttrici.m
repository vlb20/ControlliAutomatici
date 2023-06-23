syms s
num=sym2poly(1+s);
den=sym2poly(s*(1+3*s));
L=tf(30*num,den)
margin(L)
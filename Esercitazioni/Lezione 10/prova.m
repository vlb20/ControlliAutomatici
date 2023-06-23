syms s
den=sym2poly(s^2+5*s+6);
num=sym2poly(s-1);
G=tf(num,den);
sisotool(G)
%%% LDR 1/(s+1)
% syms s %variabile simbolica in s
% L=tf(1,[1 1]);
% rlocus(L)

%%% LDR 1/s(s+4)
% syms s
% num=1;
% den=sym2poly(s*(s+4));
% L=tf(num,den);
% rlocus(L)

%%% LDR k/32* 1/s((s^2/32)+(1/4)s+1)
% num=1;
% den=sym2poly(s*((s^2/32)+(s/4)+1));
% rho=1/32;
% L=tf(rho*num,den);
% 
% rlocus(L)

%%% LDR 1/(s(s+3)(s+4))
% syms s
% num=1;
% den=sym2poly(s*(s+3)*(s+4));
% L=tf(num,den);
% rlocus(L)

%%% LDR con uno zero
% syms s
% num=sym2poly(s+1);
% den=sym2poly(s*(s+3)*(s+4));
% L=tf(num,den);
% rlocus(L)

%%% Sintesi Controllo 1
% num=sym2poly((1/3)*s+1);
% den=sym2poly(s*(s+1)*((1/10)*s+1));
% L=tf((3/10)*num,den);
% rlocus(L)
% %per ta<2.5 -> rho>31.5 soddisfo

%%% Sintesi controllo 2
% % G(s)=1/s^2
% % ta<5s e s%<0.5%
% syms s
% G=tf(1,[1 0 0]);
% %primo tentativo C(s)=Ks
%     %C=tf([1 0],1); 
%     %L=C*G;
%     %rlocus(L)
%     %non si può cancellare un polo in 0 con uno zero in 0
% %secondo tentativo C(s)=K(s-10)
%     %C=tf([0.1 1],1); %C(s)=0.1s+1
%     %L=C*G;
%     %rlocus(L)
%     %controllore PD -> non realizzabile
% %terzo tentativo C(S)=K(s-10)/(s-100)
% C=tf([1 10],[1 100])
% L=C*G;
% rlocus(L)
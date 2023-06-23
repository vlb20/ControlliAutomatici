%%% Sintesi controllore in frequenza 1
% %G(s)=10/(1+10s)(1+5s)(1+s)
% % 1. e_inf<=0.1 con r(t)=Ascal(t) A=1 e d(t)=Bscal(t) B=5
% % 2. w_c>=0.2
% % 3. phi_m>=0.6
% % e_inf=lim s*S(s)*[R(s)+D(s)]<=0.1
% % e_inf=6/1+10muR <= 0.1 -> mu_r>=5.9
%
% syms s
% denG=sym2poly((1+10*s)*(1+5*s)*(1+s));
% G=tf(10,denG);
%
%%PRIMO TENTATIVO posso scegliere R(s)=C(s)=mu_R ma scelgo C(s)=mu_R/s
% den=sym2poly(s);
% R=tf(1,den);
% 
% L=R*G;
% bode(L);
% margin(L);
%
%%SECONDO TENTATIVO C(s)=mu*(1+10s)/s -> cancello la dinamica più lenta
% num=sym2poly(1+10*s);
% den=sym2poly(s);
% R=tf(num,den);
% L=R*G;
% bode(L);
% margin(L);
%
% %TERZO TENTATIVO [C(s)*mu*(1+10s)*(1+5s)]/s*(1+0.01s)
%     %-> cancello l'altra dinamica lenta e aggiungo un polo 
%     % in alta freq per renderlo realizzabile
% num=sym2poly((1+10*s)*(1+5*s));
% den=sym2poly(s*(1+0.01*s));
% R=tf(num,den);
% L=R*G;
% bode(L);
% margin(L);
%
% %QUARTO TENTATIVO -> modifico il guadagno
% num=sym2poly((1+10*s)*(1+5*s));
% den=sym2poly(s*(1+0.01*s));
% R=tf(0.06*num,den);
% L=R*G;
% bode(L);
% margin(L);

%%% Sintesi controllore in frequenza 2
% %G(s)=0.1/s(1+10s)
%     % e_inf <= 0.01 con rampa
%     % s<16%
%     % wc=0.4 rad
% % R(s)=100/s perchè e=A/mu<=0.01 -> mu>=100
% % poi usiamo una rete attenuatrice per portare wc da 100 a 0.4
% % m=100/0.4=250 e 250/T=0.04 -> T=6250
%     %L*(s)=100/s * (1+sT/m) / (1+sT)
% syms s
% 
% den_G=sym2poly(s*(1+10*s));
% G=tf(0.1,den_G);
% 
% num=sym2poly(1+s*25);
% den=sym2poly(s*(1+s*6250));
% L_star=tf(100*num,den);
% margin(L);
% 
% %dunque visto che L* rispetta tutte le specifiche
% R(s)=L_star/G
% 
% %però non è realizzabile aggiungiamo un polo almeno 
% % una decade dopo w_c -> (1+s/5)

%%% Sintesi controllore in frequenza 3
% % G(s)= 2/[(1+s)(1+0.1s)]
%     % e_inf<=0.05 con ingresso a rampa
%     % n(t) attenuato di 20 db nella banda [50 rad; +inf[
%     % phi_m>= 60°
% %
% % 1) e_inf=A/mu <= 0.05 -> mu>20 -> scelgo mu=25
%     % L'(s)=25/s -> w_c=25
% % 2) vogliamo che in w=50 attenuazione 20dB
%     % vogliamo quindi una w_c=5
% %Usiamo quindi rete attenuatrice m/T=0.5
%     % m =25/5 =5 ; T=5/0.5=10
% % Dunque L*(s)= 25/s * (1+2s)/(1+10s)
% 
% syms s
% den_G=sym2poly((1+s)*(1+0.1*s));
% G=tf(2,den_G);
% 
% num_L=sym2poly(1+2*s);
% den_L=sym2poly(s*(1+10*s));
% L_star=tf(25*num_L,den_L);
% %margin(L_star);
% 
% %scegliamo R(s)=12.5/s * [(1+2s)(1+s)]/(1+10s)
% num_R=sym2poly((1+2*s)*(1+s));
% den_R=sym2poly(s*(1+10*s));
% R=tf(12.5*num_R,den_R);
% %margin(R);
% 
% L=R*G;
% margin(L);

%%% Sintesi controllore in frequenza 4
% % G(s)=10/[s(s+10)^2]
%     % e_inf <= 0.05 rampa
%     % coppia di poli dominanti con 0.5<=zeta<=0.7
%     % w_c = 10
%     % Controllore strettamente proprio
% %
% % A/mu<=0.05 -> mu>=20 -> L'=20/s
% % 50<=phi_m<=70
% % wc=10 -> L''=10/s
% % m=20/10=2 ; m/T=1 -> T=2
% %
% %Visto che R(s)=L*(s)/G(s) -> R(s) deve avere grado =1 per 
% % essere s.p. dunque visto che G(s) ha grado 3
% % L(s) deve avere almeno grado relativo 4
% 
% syms s
% num_L=sym2poly(1+s);
% den_L=sym2poly(s*(1+2*s)*(1+0.01*s)^3);
% L=tf(20*num_L,den_L);
% margin(L);


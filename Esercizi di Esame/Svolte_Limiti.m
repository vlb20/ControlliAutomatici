%%%11) einf<0.1 rampa e reiettare d(t)=grad
%    %G(s)=1/(s^2+s) 
%         %=1/[s(s+1)]
% %G(s) -> g=1 visto che vogliamo errore
%     %limitato per la rampa -> C(s)=K
%     %R(s)=1/s^2 -> rampa
% 
% %e_inf=lim(s->0) s*S(s)*R(s) < 0.1
%     %lim s*(1/[1+k*(1/s(s+1))])*1/s^2
%     %k > 10
% 
% %altra specifica R(s)=1/s
%     %lim s*S(s)*R(s)=0
%     %k != 0

%%%12) einf<0.1 rampa e reiet d(t)=grad
    %G(s)=[s+1]/[(s+0.1)(s+10)]
        %g=0 -> C(s)=K/s

%%%13) einf=0 grad e reiet d(t)=rampa
    %G(s)=1/(s^2+s) 
    % g=1 per la seconda specifica
        %C(s)=k/s

%%%9) G(s)=1/s+2 -> guadagno che rende AS a c-c
% syms s
% denG=sym2poly(s+2);
% G=tf(1,denG);
% %C=10; %phi_m e Gm >0
% %C=100; %phi_m e Gm >0
% %C=20; %phi_m e Gm >0
% L=C*G;
% margin(L); 
% %Tutte le risposte precedenti

%%%34) G(s)=1/[s^3+s^2+s] -> C(s) per AS
% syms s
% denG=sym2poly(s^3+s^2+s);
% G=tf(1,denG);
% sisotool(G);
% %facendo variare il guadagno sul LDR
%     %vediamo che per 0<k<1 
%     %il sistema è AS

%%% G(s)=1/[s^2+5s+6]
% syms s;
% denG=sym2poly(s^2+5*s+6);
% G=tf(1,denG);
% sisotool(G)
% % sempre stabile



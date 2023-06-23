a%%%20) G(s)=[s-1]/[s^2+5s+6] 
%     %mediante LDR
%         %e_inf nullo per rif a grad
%         %Ta<5
%         %s%<20%
% syms s;
% numG=sym2poly(s-1);
% denG=sym2poly(s^2+5*s+6);
% G=tf(numG,denG);
% z=zero(G);
% p=pole(G);
% rltool(G)
% %aggiungo integratore
% %cancello il polo in -2 con zero in -1.9
% %aggiusto il guadagno in negativo

%%%19) G(s)=[s^2+s+1]/[s^2+7s+10]
%     %e_inf < 0.1 per rif a grad
%     %ta<1
%     %s<10%
% syms s;
% numG=sym2poly(s^2+s+1);
% denG=sym2poly(s^2+7*s+10);
% G=tf(numG,denG);
% z=zero(G);
% p=pole(G);
% rltool(G)
% 
% %integratore
% %cancello gli zeri complessi con
%     %poli complessi in -0.51
% %cancello i poli con zeri in -1.9 e -4.9
% %aggiusto il guadagno per farlo arrivare
%     %a circa 10

%%%32) G(s)=1/[s^3+s^2+s-1] Nyquist
%     %controllo proporzionale
%     %mediante nyquist che garantisca AS
% syms s;
% denG=sym2poly(s^3+s^2+s-1);
% G=tf(1,denG);
% p=pole(G);
% nyquist(G)
% 
% %abbiamo un solo polo a parte reale positiva
% %cioè P=1, dobbiamo avere una rotazione
% %in senso anti-orario intorno al punto
% %critico (-1,0) per ottenere N=1 allora
% %tra le due intersezioni di Nyquist(G)
% %con l'asse reale imponiamo che
% % -k<-1 e -k/2>-1 cioè k>1 e k<2
% %scegliammo k=1.8
% C=1.8;
% L=C*G;
% nyquist(L);

%%%31) G(s)=[s+2]/[s^2-2s-1] Nyquist ???
%     %controllore AS
% syms s;
% numG=sym2poly(s+2);
% denG=sym2poly(s^2-2*s-1);
% G=tf(numG,denG);
% z=zero(G);
% p=pole(G);
% nyquist(G);
% %-2k<-1 e -k/2>-1
% %k>0.5 e k<2
% C=1.5;
% L=C*G;
% nyquist(L);

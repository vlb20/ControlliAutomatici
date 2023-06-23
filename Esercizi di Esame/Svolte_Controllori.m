%%%17) G(s)=[s^2+s+1]/[s^2-1]
%     % Ta<1
%         %5/wc<1 -> wc>5
%     % s%<10% -> phi_m>60°
%         %zeta=0:0.01:1;
%         %s=100*exp((-(zeta*pi)./(sqrt(1-zeta.^2))));
%         %plot(zeta,s,'k'),grid
%         %xlabel('Smorzamento [\zeta]')
%         %ylabel('Sovraelongazione percentuale S_%')
% 
% syms s
% numG=sym2poly(s^2+s+1);
% denG=sym2poly(s^2-1);
% G=tf(numG,denG);
% p=pole(G);
% z=zero(G);
% sisotool(G);
% %poli complessi coniugati in -0.5 +-1*i
% %zero in -1
% %aggiusto il guadagno a 11 circa per il tempo di assestamento

%%%18) G(s)=[s+0.1]/[s^2+2s+1]
%     % errore nullo per rif a grad
%     % Ta<5 
%         %wc>1
%     % s%<10%
%         %phi_m>6'°
%     %attenuazioni del 0.01 nel range[100;1000]
% syms s;
% numG=sym2poly(s+0.1);
% denG=sym2poly(s^2+2*s+1);
% G=tf(numG,denG);
% z=zero(G);
% p=pole(G);
% sisotool(G)
% %cancello lo zero con il polo
% %cancello i 2 poli con 2 zeri a 1.1
% %integratore per errore a regime nullo
% %polo a -10 -> una decade prima del disturbo

%%%21) G(s)=[s+0.1]/[s^2+2s+2] ???
%     %e_inf per rif a grad
%         %integratore
%     %Ta<5 sec
%         %5/wc<5 -> wc>1
%     %s%<10%
%         %phi_m> 60°
%     %att di 0.1 dist sin in [0.01; 0.1]
% syms s;
% numG=sym2poly(s+0.1);
% denG=sym2poly(s^2+2*s+2);
% G=tf(numG,denG);
% z=zero(G);
% p=pole(G);
% sisotool(G);

%%%23) G(s)=[s+1]/[s^2+2s+2]
%     %e_inf nullo per rif grad
%     %Ta<2
%         %5/wc<2 ->wc>2.5
%     %s%<20%
%         %phi > 45°
%     %att di 0.01 d(t) 0.001 0.01
%         %wc_min=1
% syms s;
% numG=sym2poly(s+1);
% denG=sym2poly(s^2+2*s+2);
% G=tf(numG,denG);
% z=zero(G);
% p=pole(G);
% sisotool(G);
% %cancello i poli complessi con zeri in -0.9
% %metto un polo una decade prima dell'attenuazione
% %aggiusto il guadagno per farlo arrivare a circa 12

%%%24) G(s)=1/[s^2+6s+5]
%     %e_inf nullo per rif a grad
%         %integratore
%     %Ta<2
%         %5/wc<2 -> wc>2.5
%     %s%<20% -> phi_m>45°
% syms s;
% denG=sym2poly(s^2+6*s+5);
% G=tf(1,denG);
% p=pole(G);
% sisotool(G)
% %inserisco integratore per errore
%     %a regime nullo
% %canello il polo in -1 con uno zero
% %aggiusto il guadagno a circa 13 per
%     %migliorare il settling time

%%%26) G(s)=[s+1]/[s^2+6s+5]
%     %e_inf nullo per rif a grad
%         %Integrator
%     %Ta<2
%         %5/wc<2 -> wc>2.5
%     %s%<20%
%         %phi_m>45°
% syms s;
% numG=sym2poly(s+1);
% denG=sym2poly(s^2+6*s+5);
% G=tf(numG,denG);
% z=zero(G);
% p=pole(G);
% sisotool(G);
% %Integratore per l'errore nullo
% %Cancello il polo in -1 con zero in -0.9
% %Cancello lo zero in -1 con polo in -1.1
% %Aggiusto il guadagno per portarlo a circa 18

%%%28) G(s)=[s+1]/[s^2+2s+2] ???
    %e_inf nullo per rif a grad
        %integratore
    %Ta<5
        %5/wc<5 -> wc>1
    %s%<20%
        %phi_m>45°
    %att -20dB per dist sin in [10^-2; 10^-1]

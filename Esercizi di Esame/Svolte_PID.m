%PID
%guadagno|t.salita|sovraelong|t.ass|s-s error
%   kp^  |Decrease| Increase |small|Decrease  |
%   ki^  |Decrease| Increase |Incr |Eliminate |
%   kd^  |small ch| Decrease |Decr |No Effects|

%%%10) DT pid
%     %y''+2y'+5y=u(t)
%     %Controllore proporzionale
%     %Errore a regime < 0.1
%     % riferimento a gradino
% 
% %e_inf=a0/(a0+kp) * r < 0.1
% 
%     %e_inf=5/(5+kP) *1 <0.1
%     %5<(5/10 + K/10) -> 10(5-1/2)<k/10
%     %K > 45
% 
%  %scegliamo tra le opzioni k=60

%%%16) PID
%     %G(s)=1/(s^2+6s+5)
%     %errore a regime nullo 
%         %per rif a gradino
%     %Ta<5s
% 
% %su simulink
%     %risposta in openloop
%     %aggiungo kp per migliore rise time
%     %aggiungo integratore per eliminare erroe a s-s
%     %ho trovato Kp=10s e Ki=10
% 
% %metodo alternativo a simulink
% syms s;
% denG=sym2poly(s^2+6*s+5);
% G=tf(1,denG);
% C=pidtune(G,'PI') %da qui esce Kp e Ks
% L=C*G;
% F=feedback(L,1);
% step(F)

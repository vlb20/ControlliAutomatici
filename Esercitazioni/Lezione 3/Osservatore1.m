%%%Osservatore 1
% A=[-1 0;2 -3];
% B=[1 0]';
% C=[0 1];
% n=size(A); %per vedere l'ordine del sistema
% %per vedere se il sistema è osservabile:
% O=obsv(A,C);
% %vediamo se il rango è pieno (=2) 
% rank(O);
% %possiamo costruire il nostro osservatore
% 
% %Il tempo di ass <=10s -> autov < -1/2
% po=[-1 -10]; %autov. osservatore -> in realtà devono essere più grandi
% %in modulo
% 
% %dobbiamo prendere i duali: A e C trasposti
% L=(place(A',C',po))'; %assegnamo gli autovalori con il pole-placement

%%%Osservatore 2
% A=[-2 1;-10 1];
% B=[0 1]';
% C=[1 0];
% autA= eig(A); %-0.5 +- 2.7i
% 
% %controlliamo l'osservabilità
% O=obsv(A,C); %matrice di osservabilità
% rank(O); %rango
% 
% %definiamo il guadagno L 
% 	%visto che è 0.5 il dominante  andiamo almeno a 5 
% po=[-5 -10];
% L=(place(A',C',po))';

%%%SFC + FF con osservatore 1
% A=[2 1; 10 -1];
% B=[0 1]';
% C=[1 0];
% AutovA=eig(A); %sistema instabile -> va controllato
% Cu=eye(2);
% n=size(A);
% 
% %controllabilita
% CA=ctrb(A,B);
% %osservabilità
% O=obsv(A,C);
% 
% if rank(CA)==n
%     disp('il sistema è controllabile');
% else
%     disp('il sistema non è controllabile');
% end
% 
% if rank(O)==n
%     disp('il sistema è osservabile');
% else
%     disp('il sistema non è osservabile');
% end
% 
% %progettiamo il controllore
% %stabilizziamo il sistema 
% p=[-2 -10];
% K=place(A,B,p);
% 
% %progetto il feed-forward
% Kr=-1/(C*inv(A-B*K)*B);
% 
% %progettiamo l'osservatore
% L=place(A',C',[-15 -20])';

%%%SFC + FF con osservatore 2 (non revisionato)
% A=[2 1 0; 10 -1 2; -4 0 1];
% B=[1 0 0]';
% C=[0 0 1];
% Cu=eye(3);
% 
% autA = eig(A);
% n=size(A);
% 
% CA=ctrb(A,B);
% O=obsv(A,C);
% 
% if rank(CA)== n
%     disp('il sistema è controllabile');
% else
%     disp('il sistema non è controllabile');
% end
% 
% if rank(O)==n
%     disp('il sistema è osservabile');
% else
%     disp('il sistema non è osservabile');
% end
% 
% p=[-3 -10 -20];
% K=place(A,B,p);
% 
% Kr=-1/(C*inv(A-B*K)*B);
% 
% L=place(A',C',[-30 -100 -150])';

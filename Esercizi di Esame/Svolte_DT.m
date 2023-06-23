%%% 1) Osservatore 
%     %polinomio autov -1 e -5
% p1=[1 -10.5 5];
% p2=[1 16 60];
% p3=[1 8 12];
% %roots(p1) 
% roots(p2) %-10 una decade maggiore di -1
% %roots(p3)

%%% 2) Osservatore + pole place
%     %controllore in -1 -5
% A=[-1 0; -5 5];
% B=[1 0]';
% C=[1 0];
% 
% AutovA=eig(A); %sistema instabile -> va controllato
% 
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
% %Il sistema non è osservabile
%     %nel caso lo fosse stato
%     %progettiamo il controllore
%     %stabilizziamo il sistema 
%     %p=[-1 -5];
%     %K=place(A,B,p)
%     %po=[-10 -15];
%     %L=place(A',C',po)'

%%% 3) SFC
%     %AS, Ta=5 To=pi
% %tau=1 -> Re{lambda}=-1
% %To=pi -> 2pi/Im{lambda}=pi
%     %Im{lambda}=2
% A=[0 1; -10 -1];
% B=[0 1]';
% C=[1 0];
% autovA=eig(A)
% 
% CA=ctrb(A,B);
% rangoCA=rank(CA);
% %rango pieno -> controllabile
% 
% p=[-1+2*i, -1-2*i];
% K=place(A,B,p);
% 
% %scegli tra i polinomi
% a=[1 2 5];
% b=[1 -2 -5];
% c=[1 -2 5];
% roots(a) %quello desiderato

% 4) uguale al 2

%%% 5) SFC
%     %Ta=1 senza oscillazioni
% %Re{lambda} = -5
% A=[0 1; -10 -1];
% %scegli tra i polinomi
% a=[1 6 5];
% b=[1 -15 50];
% c=[1 2 5];
% d=[1 15 50];
% roots(d); %desiderato (dominante = -5)

%%% 6) Osservatore 
%     %converga con un tempo inferiore di 1
%     %Re(lambda)<-5
% A=[1 0; -5 5];
% B=[1 0]';
% C=[0 1];
% 
% autovA=eig(A);% 5 e 1
% 
% O=obsv(A,C);
% rank(O);
% %rango pieno -> osservabile
% 
% %scegliere tra i vari polinomi
% a=[1 11 18]; %-9 e -2
% b=[1 8 12]; %-6 e -2
% c=[1 16 60]; %-10 e -6
% %scelgo il c
% %scelgo quelli in modulo > 5
% %oltretutto <-5

%%% 7)Quale dei controllori K stabilizza
% A=[1 -1;3 4];
% B=[0 1]';
% C=[1 0];
% 
% autovA=eig(A); %sist. instabile
% CA=ctrb(A,B);
% rank(CA); %rango pieno -> controllabile
% 
% %scegli tra
%     %K=[-6 6]
%     %K=[6 6]
%     %K=[-6 -6]
% K=[-6 6];
% autovalori_cc=eig(A-B*K); %stabile

%%% 8) SFC+Osservatore
%     %CC autov -1 e -5
%     %oss con errore inf a 2
% A=[1 -1;3 4];
% B=[0 1]';
% C=[1 0];
% 
% autovA=eig(A); %sistema instabile -> va controllato
% 
% n=size(A);
% 
% %controllabilità
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
% K=place(A,B,[-1 -5]);
% %Voglio per l'oss lambda < -2.5
% 
% %scegli tra i polinomi
% a=[1 16 60]; %-10 -6 -> desiderato
% b=[1 9 18]; %-6 -3
% c=[1 8 12]; %-6 -2
% d=[1 -10.5 5]; %10 0.5
% roots(a);
% 
% %scelgo a
%     %-6 < -2.5
%     %-6 e -10 a sinistra di -5
%         %del controllore

%%% 22)SFC 
%     %stabilizzare con Ta=5
% A=[1 -1;3 4];
% B=[0 1]';
% C=[1 0];
% autovA=eig(A); %instabile
% 
% CA=ctrb(A,B);
% rank(CA); %rango pieno -> controllabile
% 
% %vogliamo Re{lambda} = -1
% 
% %scegliamo tra i polinomi
% a=[1 11 10]; %-10 -1 -> desiderato
%     %dominante = -1
% c=[1 10.5 5]; %-10 -0.5
% d=[1 -10.5 5]; %10 0.5
% roots(a);


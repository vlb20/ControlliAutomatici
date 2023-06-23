%%%Es. 1 Pole placement
% %ta<=10s e T=pi
% 
% %definiamoci le matrici dinamiche
% A=[1 5;7 -2];
% B=[0 1]'; %apice per fare la trasposta
% %possiamo definirlo anche B=[0; 1]
% C=eye(2);
% D=zeros(2,1); %2 righe e 1 colonna
% 
% autovalori_A=eig(A); %sist. instabile
% 
% %Controllabilità
% CA=ctrb(A,B);
% rank(A);
% %il rango è pieno
% 
% %dobbiamo stabilizzare il sistema
% %Traduzione specifiche
% %ta<=10s e T=pi
% 
% %Dalla traduzione specifiche otteniamo la posizione
% %dei poli del sistema a ciclo chiuso
% %Usiamo il pole placement
% K=place(A,B,[-0.5+2*i -0.5-2*i]);
% 
% autovalori_cc=eig(A-B*K);%controlliamo se ce li ha posizionati per bene
% 
% %controlliamo il ta
% constante_tempo=-1/(real(autovalori_cc(1)));
% tempo_assestamento=5*constante_tempo;

%%%Es.2 Pole placement
% %definiamoci le matrici dinamiche
% A=[3 -2;10 -2];
% B=[0 1]'; %apice per fare la trasposta
% %possiamo definirlo anche B=[0; 1]
% C=eye(2);
% D=zeros(2,1); %2 righe e 1 colonna
% 
% autovalori_A=eig(A); 
% 
% %Controllabilità
% CA=ctrb(A,B);
% rank(A);
% %il rango è pieno
% 
% %dobbiamo stabilizzare il sistema
% %Traduzione specifiche
% %ta<=5s
% %T=pi/2
% 
% %Dalla traduzione specifiche oteniamo la posizione
% %dei poli de sistema a ciclo chiuso
% %Usiamo il pole placement
% K=place(A,B,[-1.5-4*i -1.5+4*i]);
% 
% autovalori_cc=eig(A-B*K);
% %controlliamo il ta
% constante_tempo=-1/(real(autovalori_cc(1)));
% tempo_assestamento=5*constante_tempo;

%%%Es.3 Pole placement e Ackermann
% A=[1 2 0; 0 0 1;-5 2 1];
% B=[0 1 0]';
% 
% %Controllabilità
% CA=ctrb(A,B);
% rank(CA);
% 
% autovalori_desiderati=[-2 -6 -3];
% 
% %Progetto K con il pole placement
% K=place(A,B,autovalori_desiderati);
% autovalori_cc=(A-B*K);
% costante_tempo=-1/max(autovalori_desiderati);
% tempo_assestamento=5*costante_tempo;
% 
% %se voglio progettare K con Ackermann
% K=acker(A,B,autovalori_desiderati);

%%%Es.4 Feedforward
% %Prime specifiche a transitorio
% %Ultima a regime
% A=[0 1;-3 -4];
% B=[0 1]';
% C=eye(2);
% 
% autovalori_A=eig(A)
% 
% %controllabilità
% CA=ctrb(A,B);
% rank(CA);
% 
% %specifiche nel transitorio
% %ta<1s e no oscillazioni
% autovalori_desiderati=[-5 -10];
% K=place(A,B,autovalori_desiderati);
% 
% %Guadagno feedforward
% Kr=-1/(C*inv(A-B*K)*B); %Kr è un VETTORE!


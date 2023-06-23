%%% Ese 1
% syms s;
% denG=sym2poly(s+4);
% G=tf(5,denG);
% p=pole(G);
% sisotool(G)

%%%Ese 2
% syms s;
% numG=sym2poly(s+1);
% denG=sym2poly(s^2+5*s+6);
% G=tf(numG,denG);
% z=zero(G);
% p=pole(G);
% sisotool(G);

%%%Ese 3
% syms s;
% numG=sym2poly(s+1);
% denG=sym2poly(s^2+5*s+6);
% C=pidtune(G,'PI') %da qui esce Kp e Ks

%%%Ese 4
% A=[0 1;10 -1];
% B=[0 1]';
% 
% autovA=eig(A);
% 
% CA=ctrb(A,B);
% rangoCA=rank(CA);
% 
% p=[-1; -10];
% K=place(A,B,p);
% autovCC=eig(A-B*K);
% 
% settling_time=5*(-1/max(autovCC));

%%%Ese 5
% A=[-1 0; 2 -3];
% B=[1 0]';
% C=[0 1];
% 
% AutovA=eig(A);
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
% p_c=[-1 -5];
% K=place(A,B,p_c);
% p_o=[-15 -20];
% L=place(A',C',p_o)';
% 
% Kr=-1/(C*inv(A-B*K)*B);
% 
% eig_CC=eig(A-B*K);
% 
% t_set=5*(-1/max(eig_CC));

%%%Ese1
syms s
denG=sym2poly(s+2);
G=tf(1,denG);
%C=10; %phi_m e Gm >0
%C=100; %phi_m e Gm >0
C=20; %phi_m e Gm >0
L=C*G;
margin(L); 

%%%Ese2
A=[1 -1;3 4];
B=[0 1]';
C=[1 0];

autovA=eig(A); %sist. instabile
CA=ctrb(A,B);
rank(CA); %rango pieno -> controllabile

%scegli tra
    %K=[-6 6]
    %K=[6 6]
    %K=[-6 -6]
K=[-6 6];
autovalori_cc=eig(A-B*K); %stabile

%%%Ese 3 G(s)=[s+0.1]/[s^2+2s+2]
    %e_inf per rif a grad
        %integratore
    %Ta<5 sec
        %5/wc<5 -> wc>1
    %s%<10%
        %phi_m> 60°
    %att di 0.1 dist sin in [0.01; 0.1]
syms s;
numG=sym2poly(s+0.1);
denG=sym2poly(s^2+2*s+2);
G=tf(numG,denG);
z=zero(G);
p=pole(G);
%sisotool(G);

denC=sym2poly(s*(s+0.1)*(s+100));
numC=sym2poly(s^2+2*s+2);
C=tf(165.69*numC,denC);
L=C*G

%%% Ese 5 Osservatore
    %CC autov -1 e -5
A=[1 -1;3 4];
B=[0 1]';
C=[1 0];

autovA=eig(A); %sistema instabile -> va controllato

n=size(A);

%controllabilità
CA=ctrb(A,B);
%osservabilità
O=obsv(A,C);

rangoCA=rank(CA);
rangoO=rank(O);

K=place(A,B,[-1 -5]);

%scegli tra i polinomi
a=[1 8 12]; %-6 -2
b=[1 -10.5 5]; %10 0.5
c=[1 16 60]; %-10 -6 -> desiderato

%scelgo c
    %-6 e -10 a sinistra di -5
        %del controllore
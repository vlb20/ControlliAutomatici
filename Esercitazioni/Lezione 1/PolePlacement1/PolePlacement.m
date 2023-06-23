%%Ex. Pole-Placement (Retroazione di stato) 1
% A=[0 1 0; 0 0 1; -5 2 1];
% B=[0; 0; 1];
% autovalori=eig(A);
% CA=ctrb(A,B);
% rango_CA = rank(CA);
% autovalori_desiderati=[-1;-6;-2];
% K=place(A,B,autovalori_desiderati);
% autovalori_cc=eig(A-B*K)

%%Ex. Pole-Placement (Retroazione di stato) 2
% A=[1 5; 7 -2];
% B=[0;1];
% autovalori_openloop=eig(A); %autovalori sistema non controllato
% CA=ctrb(A,B);
% rango_CA = rank(CA);
% autovalori_desiderati=[-0.5+2*i; -0.5-2*i]; %ta<10s e T=pi
% K=place(A,B,autovalori_desiderati);
% autovalori_cc=eig(A-B*K)

%%%Ex. Pole-Placement (Retroazione di stato) 3
% A=[0 1; 10 -1];
% B=[0;1];
% C=eye(2);
% D=zeros(2,1); 
% autovalori_openloop=eig(A);
% CA=ctrb(A,B);
% rango_CA = rank(CA);
%%5tau=5 -> lambda=-1 minimo 
%%no oscillazioni -> parte immaginaria = 0
% autovalori_desiderati=[-1; -10];
% K=place(A,B,autovalori_desiderati);
% autovalori_cc=eig(A-B*K);
%%tau
%timeconstant_cc=-1/(max(autovalori_cc));
%%ci prende il max quindi il dominante
% settling_time_cc=5*timeconstant_cc;

%%Feed forward
%Kr=-1/(C*inv(A-B*K)*B)
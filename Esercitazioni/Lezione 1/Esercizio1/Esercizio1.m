A=[-1 -2; 1 -1];
B=[0;1];
autovalori=eig(A)
autovalore_dominante=real(autovalori(1,1));
tempo_assestamento=5*(-1/autovalore_dominante);
periodo_oscillazione=(2*pi)/imag(autovalori(1,1));
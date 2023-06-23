zeta=0:0.01:1;
s=100*exp((-(zeta*pi)./(sqrt(1-zeta.^2))));
plot(zeta,s,'k'),grid
xlabel('Smorzamento [\zeta]')
ylabel('Sovraelongazione percentuale S_%')

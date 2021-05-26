clear all, close all
%parametry
g=9.81;
Vpocz=20;


mw = 1200; 
Jw = 0.01;
rw = 0.30;


%moment hamowania
Tb=300;

%nawierzchnia 1 - suchy beton, 2 - mokry beton, 3 - śnieg, 4 - lód
pav=1;


a=[0.9 0.7 0.3 0.1];
b=[1.07 1.07 1.07 1.07]; c=[0.2773 0.5 0.1773 0.38];
d=[0.0026 0.003 0.006 0.007];
 
a = a(pav);
b = b(pav);
c = c(pav);
d = d(pav);
 
y=[fcn_u(0,pav),fcn_u(1,pav)];


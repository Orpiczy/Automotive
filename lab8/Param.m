%Parametry silnika
La_plus_Lfield = 6.008e-03;
Laf = 1.766e-03;
Ra_plus_Rf = 0.12;
B = 0.0002;
J = 0.05;
%sterowanie, zbuduj funkcje gen sygn ster w simulniku V = 0–48;
i = 78; % (250A max)
wnom = 2800;%(r/min) (v=25km/h) 

%Parametry pojazdu
m = 800;
A = 1.8;%m2
ro = 1.25;% (khg/m3)
Cd =  0.3;%
urr = 0.015;
r = 0.25;%m
G = 11;

%sta³e fizyczne
g = 9.81;
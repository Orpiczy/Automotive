%parametry

mc =250; %kg
mw =30; %kg
cc =15000;% N/m
cw =200000;% N/m
dc =200; %Ns/m
dw =10; %Ns/m

%warunki pocz�tkowe
xc=0.5;
xw=0.2;

%parametry regulatora
alfa_beg=1;
beta_beg=1;
k_beg=1;

alfa=alfa_beg;
beta=beta_beg;
k=k_beg;

er_beg=find_error([alfa,beta,k]);
[reg_param,er_end]=fminsearch('find_error',[alfa,beta,k]);
msgbox({['Warto�� ca�ki z kwadratu zmian xc'],['na pocz�tku = ',num2str(er_beg),', na ko�cu = ',num2str(er_end)]})
msgbox({['Warto�ci parametr�w na pocz�tku k = ',num2str(k_beg),',alfa = ',num2str(alfa_beg),',beta = ',num2str(beta_beg)],
        ['po optymalizacji k = ',num2str(reg_param(3)),',alfa = ',num2str(reg_param(1)),',beta = ',num2str(reg_param(2))]})
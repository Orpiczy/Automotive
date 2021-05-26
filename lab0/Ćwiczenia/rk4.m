function [t,x]=rk4(x0, u, h, dxModel)
% x0 - punkt poczatkowy
% u - wektor sterowan
% h - krok symulacji
% dxModel - uchywt do funkcji liczasy wartosc pochodnej w 

nt = length(u);
n = length(x0);
tf = nt * h;

x=zeros(nt,n); 
tmp=zeros(n,1);

xtmp=x0;
x(1,:)=x0';   %przypisuje  [X, Y, fi, v];
t=0; 
dx1=zeros(n,1);     %tworzenia miejsca na rozwi¹zania, bo n to jest iloœæ zmiennych równania
dx2=dx1;
dx3=dx1;
dx4=dx1;
h_2=h/2;            %przygotowanie algorytmu Rungego Kutty i odpowiednich przedzia³ów
h_6=h/6; 
h_26=2*h_6;
for i=1:nt
    
        dx1 = dxModel(t, xtmp, u(i,:)); %zwraca x_dot,y_dot,psi_dot oraz v_dot dla arg pocz xtmp(x0)
        tmp=xtmp+h_2*dx1;
        t=t+h_2; 
        
        dx2 = dxModel(t, xtmp, u(i,:)); 
        tmp=xtmp + h_2 * dx2;
        
        dx3  = dxModel(t, xtmp, u(i,:)); 
        tmp=xtmp+h*dx3;
        t=t+h_2; 
        
        dx4 = dxModel(t, xtmp, u(i,:)); 
        xtmp=xtmp+h_6 * (dx1+dx4)+h_26 * (dx2+dx3); 
        x(i,:)=xtmp';                       %pierwszy wiersz x to rozwi¹zanie numer 1
end
t=linspace(0,tf,nt)';
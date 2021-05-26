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
x(1,:)=x0';
t=0; 
dx1=zeros(n,1);
dx2=dx1;
dx3=dx1;
dx4=dx1;
h_2=h/2; 
h_6=h/6; 
h_26=2*h_6;
for i=1:nt
    dx1 = dxModel(t, xtmp, u(i,:)); 
    tmp=xtmp+h_2*dx1;
    t=t+h_2; 
    
    dx2 = dxModel(t, tmp, u(i,:)); 
    tmp=xtmp+h_2*dx2; 
    
    dx3 = dxModel(t, tmp, u(i,:));
    tmp=xtmp+h*dx3;
    t=t+h_2; 
    
    dx4 = dxModel(t, tmp, u(i,:)); 
    xtmp=xtmp+h_6*(dx1+dx4)+h_26*(dx2+dx3); 
    x(i,:)=xtmp';
end
t=linspace(0,tf,nt)';
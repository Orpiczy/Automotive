%Warunki pocz¹tkowe
h=0.1;
v=1;
x0=[0 0 0 v];

%zawiera dlugosci pojazdow do przeanalizowania
L=[1 3 10 30];

%przygotowanie sterowañ

%1
u1=zeros(800,3);
u1(:,1)= deg2rad(5);

%2
T=80;
u2=zeros(800,3);
for i=1:T/h
    u2(i,1)=deg2rad(10)*sin((0.25/(2*pi))*i*h);
end

%3
u3=zeros(3200,3);
u3(1:800,1)=deg2rad(10);
u3(801:1600,1)=deg2rad(-10);
u3(1601:2400,1)=deg2rad(10);
u3(2401:3200,1)=deg2rad(-10);

%4
u4=zeros(800,3);
u4(:,2)= deg2rad(-5);

%5
u5=zeros(800,3);
for i=1:T/h
    u5(i,2)=deg2rad(-10)*sin((0.25/(2*pi))*i*h);
end

%6
u6=zeros(3200,3);
u6(1:800,2)=deg2rad(-10);
u6(801:1600,2)=deg2rad(10);
u6(1601:2400,2)=deg2rad(-10);
u6(2401:3200,2)=deg2rad(10);

u=cell(6,1);
u{1}=u1;
u{2}=u2;
u{3}=u3;
u{4}=u4;
u{5}=u5;
u{6}=u6;
for i=1:6
traceplot(h,x0,u{i},L,i)
end
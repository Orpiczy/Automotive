%warunki pocz¹tkowe
X=0;
Y=0;
psi=0;
v=1;
x0=[X Y psi v];

h=0.1;
a=0;
T=80;
L=[1 3 10 30];


%skrêt kó³
sigma_r=@(t) deg2rad(0);
sigma_f=@(t) deg2rad(5);

%przygotowanie sterowania
contr_param=[sigma_r(0),sigma_f(0),a];
for i=1:T/h
    contr_param=[contr_param;sigma_r(i*h),sigma_f(i*h),a];
end


figure(1)
for i=1:length(L)
    
    Lr=L(i);
    Lf=0;
    dxModel=@(t,x,u) kinematicBicycleModel(t,x,u,Lf,Lr);
    [t1,x1]=rk4(x0,contr_param,h,dxModel);
    
    Lr=L(i)/2;
    Lf=L(i)/2;
    dxModel=@(t,x,u) kinematicBicycleModel(t,x,u,Lf,Lr);
    [t2,x2]=rk4(x0,contr_param,h,dxModel);
    
    Lr=0;
    Lf=L(i);
    dxModel=@(t,x,u) kinematicBicycleModel(t,x,u,Lf,Lr);
    [t3,x3]=rk4(x0,contr_param,h,dxModel);
   
    subplot(2,2,i)
    hold on;
    plot(x1(:, 1), x1(:,2));
    plot(x2(:, 1), x2(:,2));
    plot(x3(:, 1), x3(:,2));
    legend("przednia","srodek","tyl")
    title("L = " + mat2str(L(i)));
    hold off;
end



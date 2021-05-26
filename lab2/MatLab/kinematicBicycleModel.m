function  [result]=kinematicBicycleModel(t,x,u,Lr,Lf)
    sigma_f=u(1);
    sigma_r=u(2);
    a=u(3);
    psi=x(3);
    v=x(4);

    Beta=atan(((Lf*tan(sigma_r)+Lr*tan(sigma_f))/(Lf+Lr)));

    result=[v*cos(psi+Beta),v*sin(psi+Beta),v*cos(Beta)*(tan(sigma_f)-tan(sigma_r))/(Lf+Lr),a];
end
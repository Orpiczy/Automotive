function [result]=kinematicBicycleModel(t,x,u,Lf,Lr)

sigma_f=u(1);
sigma_r=u(2);

psi=x(3);
v=x(4);

beta=atan((Lr*tan(sigma_f)+Lf*tan(sigma_r))/(Lf+Lr));
result=[v*cos(psi),v*sin(psi),v*cos(beta)*(tan(sigma_f)-tan(sigma_r))/(Lf+Lr),u(3)];
end
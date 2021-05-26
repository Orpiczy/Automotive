function []=traceplot(h,x0,u1,L,nr)

figure(nr)
for i=1:4
    subplot(2,2,i)
    title("L = "+int2str(L(i)));
    hold on
    Lf=0;
    Lr=L(i);
    dxModel = @(t, x, u) kinematicBicycleModel(t, x, u, Lf,Lr);
    [t,x1]=rk4(x0, u1, h, dxModel);
    plot(x1(:,1),x1(:,2))

    Lf=L(i)/2;
    Lr=L(i)/2;
    dxModel = @(t, x, u) kinematicBicycleModel(t, x, u, Lf,Lr);
    [t,x2]=rk4(x0, u1, h, dxModel);
    plot(x2(:,1),x2(:,2))

    Lf=L(i);
    Lr=0;
    dxModel = @(t, x, u) kinematicBicycleModel(t, x, u, Lf,Lr);
    [t,x3]=rk4(x0, u1, h, dxModel);
    plot(x3(:,1),x3(:,2))
    legend("przód","œrodek","ty³",'Location','northwest');
end
sgtitle("Sterowanie "+int2str(nr(1)))
hold off
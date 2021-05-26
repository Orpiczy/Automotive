function y = fcn_u(u,pav)
a=[ 0.9 0.7 0.3 0.1];
b=[1.07 1.07 1.07 1.07];
c=[0.2773 0.5 0.1773 0.38];
d=[0.0026 0.003 0.006 0.007];

%twoje zmiany
%u=1-u;

a = a(pav);
b = b(pav);
c = c(pav);
d = d(pav);

y=a.*(b.*(1-exp(-c.*u))-d.*u);
end

    
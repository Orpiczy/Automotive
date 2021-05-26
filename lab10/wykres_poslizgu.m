x=0:0.01:1;


figure(1)
plot(x,fcn_u(x,1))
title("Suchy beton")
xlabel("Poślizg")
ylabel("Współczynnik tarcia")
maks_suchy_beton=max(fcn_u(x,1));

figure(2)
plot(x,fcn_u(x,2))
title("Mokry beton")
maks_mokry_beton=max(fcn_u(x,2));
xlabel("Poślizg")
ylabel("Współczynnik tarcia")


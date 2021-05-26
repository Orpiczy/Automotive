function error = find_error(var)
assignin('base','alfa',var(1));
assignin('base','beta',var(2));
assignin('base','k',var(3));
out=sim("model");
dxc=diff(out.xc.Data);
dt=diff(out.xc.Time);
dxc2=dxc.*dxc;
error=sum(dxc2.*dt);
end
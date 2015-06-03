function theta = plotCubicModel(FVClean)
x = FVClean(:,1);
y = FVClean(:,2);
xx = x.*x;
xxx = xx.*x;
theta = normalEqn2([x xx xxx], y);
xstep = (max(x) - min(x)) / 100;
xbins = [((floor(min(x)/xstep))*xstep):xstep:((ceil(max(x)/xstep))*xstep)]';
ybins = [ones(size(xbins,1),1) xbins xbins.*xbins xbins.*xbins.*xbins] * theta;
plot(xbins, ybins);
hold on;

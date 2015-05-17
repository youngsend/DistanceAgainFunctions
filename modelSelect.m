function theta = modelSelect(x, y)
% Both x and y are vectors.
% I only compare and select from linear, quadratic and cubic models.

% Now, I divide x and y into training set and test set, randomly choosing 70% and 30% for each set after shuffle.
m = size(x, 1);
randorder = randperm(m);
x = x(randorder,:);
y = y(randorder,:);
train_size = floor(m*0.7);
xtrain = x(1:train_size);
ytrain = y(1:train_size);
xtest = x(train_size+1:end);
ytest = y(train_size+1:end);
mtest = m - train_size;

% First, linear model
xtest_interp = [ones(mtest, 1) xtest];
theta1 = normalEqn2(xtrain, ytrain);
J_linear = (xtest_interp*theta1 - ytest)' * (xtest_interp*theta1 - ytest) / (2*mtest);

% Second, quadratic model
xxtrain = xtrain .* xtrain;
theta2 = normalEqn2([xtrain xxtrain], ytrain);
xxtest = xtest .* xtest;
xxtest = [xtest xxtest];
xxtest_interp = [ones(mtest, 1) xxtest];
J_quadratic = (xxtest_interp*theta2 - ytest)' * (xxtest_interp*theta2 - ytest) / (2*mtest);

% Third, cubic model
xxxtrain = xxtrain .* xtrain;
theta3 = normalEqn2([xtrain xxtrain xxxtrain], ytrain);
xxxtest = xtest .* xtest .* xtest;
xxxtest = [xxtest xxxtest];
xxxtest_interp = [ones(mtest, 1) xxxtest];
J_cubic = (xxxtest_interp*theta3 - ytest)' * (xxxtest_interp*theta3 - ytest) / (2*mtest);

% Choose the model that makes J the minimal
if (J_linear <= J_quadratic) && (J_linear <= J_cubic)
	theta = theta1;
	str = ['The best model is Linear Model, and the Test Error is ', num2str(J_linear), '. The Model is y = ', num2str(theta(1)), ' + ', num2str(theta(2)), ' * x. J_Quadratic is: ', num2str(J_quadratic), '. J_cubic is: ', num2str(J_cubic)];
	figure;
	hist2D(xtrain,ytrain,50,50);
	title(['Model from Training Set: ', str]);
	xstep = (max(xtrain) - min(xtrain)) / 100;
	xbins = [((floor(min(xtrain)/xstep))*xstep):xstep:((ceil(max(xtrain)/xstep))*xstep)]';
	ybins = [ones(size(xbins,1),1) xbins] * theta;
	plot(xbins, ybins);
	figure;
	hist2D(xtest, ytest, 50, 50);
	title(['Use model on Test Set: ', str]);
	xstep = (max(xtest) - min(xtest)) / 100;
	xbins = [((floor(min(xtest)/xstep))*xstep):xstep:((ceil(max(xtest)/xstep))*xstep)]';
	ybins = [ones(size(xbins,1),1) xbins] * theta;
	plot(xbins, ybins);
	
elseif (J_quadratic <= J_cubic)
	theta = theta2;
	str = ['The best model is Quadratic Model, and the Test Error is ', num2str(J_quadratic), '. The Model is y = ', num2str(theta(1)), ' + ', num2str(theta(2)), ' * x + ', num2str(theta(3)), ' * x^2. J_Linear is :', num2str(J_linear), '. J_Cubic is: ', num2str(J_cubic)];
	figure;
	hist2D(xtrain,ytrain,50,50);
	title(['Model from Training Set: ', str]);
	xstep = (max(xtrain) - min(xtrain)) / 100;
	xbins = [((floor(min(xtrain)/xstep))*xstep):xstep:((ceil(max(xtrain)/xstep))*xstep)]';
	ybins = [ones(size(xbins,1),1) xbins xbins.*xbins] * theta;
	plot(xbins, ybins);
	figure;
	hist2D(xtest, ytest, 50, 50);
	title(['Use model on Test Set: ', str]);
	xstep = (max(xtest) - min(xtest)) / 100;
	xbins = [((floor(min(xtest)/xstep))*xstep):xstep:((ceil(max(xtest)/xstep))*xstep)]';
	ybins = [ones(size(xbins,1),1) xbins xbins.*xbins] * theta;
	plot(xbins, ybins);
else
	theta = theta3;
	str = ['The best model is Cubic Model, and the Test Error is ', num2str(J_cubic), '. The Model is y = ', num2str(theta(1)), ' + ', num2str(theta(2)), ' * x + ', num2str(theta(3)), ' * x^2 + ', num2str(theta(4)), ' * x^3. J_Linear is: ', num2str(J_linear), '. J_Quadratic is: ', num2str(J_quadratic)];
	figure;
	hist2D(xtrain,ytrain,50,50);
	title(['Model from Training Set: ', str]);
	xstep = (max(xtrain) - min(xtrain)) / 100;
	xbins = [((floor(min(xtrain)/xstep))*xstep):xstep:((ceil(max(xtrain)/xstep))*xstep)]';
	ybins = [ones(size(xbins,1),1) xbins xbins.*xbins xbins.*xbins.*xbins] * theta;
	plot(xbins, ybins);
	figure;
	hist2D(xtest, ytest, 50, 50);
	title(['Use model on Test Set: ', str]);
	xstep = (max(xtest) - min(xtest)) / 100;
	xbins = [((floor(min(xtest)/xstep))*xstep):xstep:((ceil(max(xtest)/xstep))*xstep)]';
	ybins = [ones(size(xbins,1),1) xbins xbins.*xbins xbins.*xbins.*xbins] * theta;
	plot(xbins, ybins);
end

end

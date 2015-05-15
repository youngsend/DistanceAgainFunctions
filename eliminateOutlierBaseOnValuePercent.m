function F_clean = eliminateOutlierBaseOnValuePercent(F, clean_percent)
% I want to eliminate outliers using Matlab Function tabulate.
T = tabulate(F);
m = size(T, 1);
for i = 1:m,
	if T(i, 3) <= clean_percent % 3 means 3%
		F = F(F~=T(i, 1));
	end
end
F_clean = F;
end
		

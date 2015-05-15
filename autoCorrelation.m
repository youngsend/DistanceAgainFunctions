function R = autoCorrelation(Acc, cut)
m = size(Acc,1);
%miu = mean(Acc);
%sigma = std(Acc);
% R1 store the R from cut to the begining; turn Left
R1 = zeros(cut,1);
left_num = cut;
Acc1 = Acc(1:cut);
miu1 = mean(Acc1);
sigma1 = std(Acc1);

% R2 store the R from cut to the end; turn Right
R2 = zeros(m-cut+1,1);
right_num = m-cut+1;
Acc2 = Acc(cut:m);
miu2 = mean(Acc2);
sigma2 = std(Acc2);

for tao2 = 0:m-cut,
	A = zeros(m-cut+1-tao2,1);
	for i = 1:m-cut+1-tao2,
		A(i) = (Acc2(i)-miu2)*(Acc2(i+tao2)-miu2);
	end
	R2(tao2+1) = mean(A) / sigma2^2;
end

for tao1 = (cut-1):-1:0,
	A = zeros(cut-tao1,1);
 	for i = 1:cut-tao1,
		A(i) = (Acc1(cut-i+1)-miu1)*(Acc1(cut-i+1-tao1)-miu1);
	end
	R1(cut-tao1) = mean(A) / sigma1^2;
end
R = [R1(1:cut-1);R2];
end

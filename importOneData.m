function M = importOneData(filename, sample_rate)
data = load(filename);
accZ = data(:,6);
m = size(accZ, 1);
% We want samples of a period of 100 seconds
need_sample_number = sample_rate * 100;
if m < need_sample_number
	error('Samples Not Enough! Less than 100 seconds!');
else
	x = floor(m/2);
	M = accZ((x - need_sample_number/2 + 1):(x + need_sample_number/2));
end

% This function is used to import all .txt data to MatLab, extract their Accelerometer Z-axis vector and name these vectors after corresponding velocity, such as accZ5_6, which means this vector is collected under 5.6km/h for 100 seconds.

% We need to know sample rate to decide the sample numbers. Nexus 4: 199Hz, Nexus 5: 200Hz or 128Hz.

% In order to have all these accZ*_* vectors, I can't write function.
clear;
sample_rate = 199;
sequence_time = 2;
clean_percent = 3;
txtFiles = dir('*.txt');
numfiles = length(txtFiles);
if numfiles ~= 25
	error('There are %d files. Error! You must have 25 files!', numfiles);	
else
	disp('There are 25 files. Correct!');
	accZ3_0 = importOneData(txtFiles(1).name, sample_rate);
	accZ5_6 = importOneData(txtFiles(2).name, sample_rate);
	accZ3_2 = importOneData(txtFiles(3).name, sample_rate);
	accZ5_8 = importOneData(txtFiles(4).name, sample_rate);
	accZ3_4 = importOneData(txtFiles(5).name, sample_rate);
	accZ6_0 = importOneData(txtFiles(6).name, sample_rate);
	accZ3_6 = importOneData(txtFiles(7).name, sample_rate);
	accZ6_2 = importOneData(txtFiles(8).name, sample_rate);
	accZ3_8 = importOneData(txtFiles(9).name, sample_rate);
	accZ6_4 = importOneData(txtFiles(10).name, sample_rate);
	accZ4_0 = importOneData(txtFiles(11).name, sample_rate);
	accZ6_6 = importOneData(txtFiles(12).name, sample_rate);
	accZ4_2 = importOneData(txtFiles(13).name, sample_rate);
	accZ6_8 = importOneData(txtFiles(14).name, sample_rate);
	accZ4_4 = importOneData(txtFiles(15).name, sample_rate);
	accZ7_0 = importOneData(txtFiles(16).name, sample_rate);
	accZ4_6 = importOneData(txtFiles(17).name, sample_rate);
	accZ7_2 = importOneData(txtFiles(18).name, sample_rate);
	accZ4_8 = importOneData(txtFiles(19).name, sample_rate);
	accZ7_4 = importOneData(txtFiles(20).name, sample_rate);
	accZ5_0 = importOneData(txtFiles(21).name, sample_rate);
	accZ7_6 = importOneData(txtFiles(22).name, sample_rate);
	accZ5_2 = importOneData(txtFiles(23).name, sample_rate);
	accZ7_8 = importOneData(txtFiles(24).name, sample_rate);
	accZ5_4 = importOneData(txtFiles(25).name, sample_rate);

	[CutLocZ3_0, FZ3_0] = getCutLocWithMatlabAutocorr(accZ3_0, sample_rate, 3.0, sequence_time);
	[CutLocZ3_2, FZ3_2] = getCutLocWithMatlabAutocorr(accZ3_2, sample_rate, 3.2, sequence_time);
	[CutLocZ3_4, FZ3_4] = getCutLocWithMatlabAutocorr(accZ3_4, sample_rate, 3.4, sequence_time);
	[CutLocZ3_6, FZ3_6] = getCutLocWithMatlabAutocorr(accZ3_6, sample_rate, 3.6, sequence_time);
	[CutLocZ3_8, FZ3_8] = getCutLocWithMatlabAutocorr(accZ3_8, sample_rate, 3.8, sequence_time);
	[CutLocZ4_0, FZ4_0] = getCutLocWithMatlabAutocorr(accZ4_0, sample_rate, 4.0, sequence_time);
	[CutLocZ4_2, FZ4_2] = getCutLocWithMatlabAutocorr(accZ4_2, sample_rate, 4.2, sequence_time);
	[CutLocZ4_4, FZ4_4] = getCutLocWithMatlabAutocorr(accZ4_4, sample_rate, 4.4, sequence_time);
	[CutLocZ4_6, FZ4_6] = getCutLocWithMatlabAutocorr(accZ4_6, sample_rate, 4.6, sequence_time);
	[CutLocZ4_8, FZ4_8] = getCutLocWithMatlabAutocorr(accZ4_8, sample_rate, 4.8, sequence_time);
	[CutLocZ5_0, FZ5_0] = getCutLocWithMatlabAutocorr(accZ5_0, sample_rate, 5.0, sequence_time);
	[CutLocZ5_2, FZ5_2] = getCutLocWithMatlabAutocorr(accZ5_2, sample_rate, 5.2, sequence_time);
	[CutLocZ5_4, FZ5_4] = getCutLocWithMatlabAutocorr(accZ5_4, sample_rate, 5.4, sequence_time);
	[CutLocZ5_6, FZ5_6] = getCutLocWithMatlabAutocorr(accZ5_6, sample_rate, 5.6, sequence_time);
	[CutLocZ5_8, FZ5_8] = getCutLocWithMatlabAutocorr(accZ5_8, sample_rate, 5.8, sequence_time);
	[CutLocZ6_0, FZ6_0] = getCutLocWithMatlabAutocorr(accZ6_0, sample_rate, 6.0, sequence_time);
	[CutLocZ6_2, FZ6_2] = getCutLocWithMatlabAutocorr(accZ6_2, sample_rate, 6.2, sequence_time);
	[CutLocZ6_4, FZ6_4] = getCutLocWithMatlabAutocorr(accZ6_4, sample_rate, 6.4, sequence_time);
	[CutLocZ6_6, FZ6_6] = getCutLocWithMatlabAutocorr(accZ6_6, sample_rate, 6.6, sequence_time);
	[CutLocZ6_8, FZ6_8] = getCutLocWithMatlabAutocorr(accZ6_8, sample_rate, 6.8, sequence_time);
	[CutLocZ7_0, FZ7_0] = getCutLocWithMatlabAutocorr(accZ7_0, sample_rate, 7.0, sequence_time);
	[CutLocZ7_2, FZ7_2] = getCutLocWithMatlabAutocorr(accZ7_2, sample_rate, 7.2, sequence_time);
	[CutLocZ7_4, FZ7_4] = getCutLocWithMatlabAutocorr(accZ7_4, sample_rate, 7.4, sequence_time);
	[CutLocZ7_6, FZ7_6] = getCutLocWithMatlabAutocorr(accZ7_6, sample_rate, 7.6, sequence_time);
	[CutLocZ7_8, FZ7_8] = getCutLocWithMatlabAutocorr(accZ7_8, sample_rate, 7.8, sequence_time);

	FZClean3_0 = eliminateOutlierBaseOnValuePercent(FZ3_0, clean_percent);
	FZClean3_2 = eliminateOutlierBaseOnValuePercent(FZ3_2, clean_percent);
	FZClean3_4 = eliminateOutlierBaseOnValuePercent(FZ3_4, clean_percent);
	FZClean3_6 = eliminateOutlierBaseOnValuePercent(FZ3_6, clean_percent);
	FZClean3_8 = eliminateOutlierBaseOnValuePercent(FZ3_8, clean_percent);
	FZClean4_0 = eliminateOutlierBaseOnValuePercent(FZ4_0, clean_percent);
	FZClean4_2 = eliminateOutlierBaseOnValuePercent(FZ4_2, clean_percent);
	FZClean4_4 = eliminateOutlierBaseOnValuePercent(FZ4_4, clean_percent);
	FZClean4_6 = eliminateOutlierBaseOnValuePercent(FZ4_6, clean_percent);
	FZClean4_8 = eliminateOutlierBaseOnValuePercent(FZ4_8, clean_percent);
	FZClean5_0 = eliminateOutlierBaseOnValuePercent(FZ5_0, clean_percent);
	FZClean5_2 = eliminateOutlierBaseOnValuePercent(FZ5_2, clean_percent);
	FZClean5_4 = eliminateOutlierBaseOnValuePercent(FZ5_4, clean_percent);
	FZClean5_6 = eliminateOutlierBaseOnValuePercent(FZ5_6, clean_percent);
	FZClean5_8 = eliminateOutlierBaseOnValuePercent(FZ5_8, clean_percent);
	FZClean6_0 = eliminateOutlierBaseOnValuePercent(FZ6_0, clean_percent);
	FZClean6_2 = eliminateOutlierBaseOnValuePercent(FZ6_2, clean_percent);
	FZClean6_4 = eliminateOutlierBaseOnValuePercent(FZ6_4, clean_percent);
	FZClean6_6 = eliminateOutlierBaseOnValuePercent(FZ6_6, clean_percent);
	FZClean6_8 = eliminateOutlierBaseOnValuePercent(FZ6_8, clean_percent);
	FZClean7_0 = eliminateOutlierBaseOnValuePercent(FZ7_0, clean_percent);
	FZClean7_2 = eliminateOutlierBaseOnValuePercent(FZ7_2, clean_percent);
	FZClean7_4 = eliminateOutlierBaseOnValuePercent(FZ7_4, clean_percent);
	FZClean7_6 = eliminateOutlierBaseOnValuePercent(FZ7_6, clean_percent);
	FZClean7_8 = eliminateOutlierBaseOnValuePercent(FZ7_8, clean_percent);

	FVClean = [FZClean3_0 ones(size(FZClean3_0,1),1)*3.0];
	FVClean = [FVClean; FZClean3_2 ones(size(FZClean3_2,1),1)*3.2];
	FVClean = [FVClean; FZClean3_4 ones(size(FZClean3_4,1),1)*3.4];
	FVClean = [FVClean; FZClean3_6 ones(size(FZClean3_6,1),1)*3.6];
	FVClean = [FVClean; FZClean3_8 ones(size(FZClean3_8,1),1)*3.8];
	FVClean = [FVClean; FZClean4_0 ones(size(FZClean4_0,1),1)*4.0];
	FVClean = [FVClean; FZClean4_2 ones(size(FZClean4_2,1),1)*4.2];
	FVClean = [FVClean; FZClean4_4 ones(size(FZClean4_4,1),1)*4.4];
	FVClean = [FVClean; FZClean4_6 ones(size(FZClean4_6,1),1)*4.6];
	FVClean = [FVClean; FZClean4_8 ones(size(FZClean4_8,1),1)*4.8];
	FVClean = [FVClean; FZClean5_0 ones(size(FZClean5_0,1),1)*5.0];
	FVClean = [FVClean; FZClean5_2 ones(size(FZClean5_2,1),1)*5.2];
	FVClean = [FVClean; FZClean5_4 ones(size(FZClean5_4,1),1)*5.4];
	FVClean = [FVClean; FZClean5_6 ones(size(FZClean5_6,1),1)*5.6];
	FVClean = [FVClean; FZClean5_8 ones(size(FZClean5_8,1),1)*5.8];
	FVClean = [FVClean; FZClean6_0 ones(size(FZClean6_0,1),1)*6.0];
	FVClean = [FVClean; FZClean6_2 ones(size(FZClean6_2,1),1)*6.2];
	FVClean = [FVClean; FZClean6_4 ones(size(FZClean6_4,1),1)*6.4];
	FVClean = [FVClean; FZClean6_6 ones(size(FZClean6_6,1),1)*6.6];
	FVClean = [FVClean; FZClean6_8 ones(size(FZClean6_8,1),1)*6.8];
	FVClean = [FVClean; FZClean7_0 ones(size(FZClean7_0,1),1)*7.0];
	FVClean = [FVClean; FZClean7_2 ones(size(FZClean7_2,1),1)*7.2];
	FVClean = [FVClean; FZClean7_4 ones(size(FZClean7_4,1),1)*7.4];
	FVClean = [FVClean; FZClean7_6 ones(size(FZClean7_6,1),1)*7.6];
	FVClean = [FVClean; FZClean7_8 ones(size(FZClean7_8,1),1)*7.8];

	FV = [FZ3_0 ones(size(FZ3_0,1),1)*3.0];
	FV = [FV; FZ3_2 ones(size(FZ3_2,1),1)*3.2];
	FV = [FV; FZ3_4 ones(size(FZ3_4,1),1)*3.4];
	FV = [FV; FZ3_6 ones(size(FZ3_6,1),1)*3.6];
	FV = [FV; FZ3_8 ones(size(FZ3_8,1),1)*3.8];
	FV = [FV; FZ4_0 ones(size(FZ4_0,1),1)*4.0];
	FV = [FV; FZ4_2 ones(size(FZ4_2,1),1)*4.2];
	FV = [FV; FZ4_4 ones(size(FZ4_4,1),1)*4.4];
	FV = [FV; FZ4_6 ones(size(FZ4_6,1),1)*4.6];
	FV = [FV; FZ4_8 ones(size(FZ4_8,1),1)*4.8];
	FV = [FV; FZ5_0 ones(size(FZ5_0,1),1)*5.0];
	FV = [FV; FZ5_2 ones(size(FZ5_2,1),1)*5.2];
	FV = [FV; FZ5_4 ones(size(FZ5_4,1),1)*5.4];
	FV = [FV; FZ5_6 ones(size(FZ5_6,1),1)*5.6];
	FV = [FV; FZ5_8 ones(size(FZ5_8,1),1)*5.8];
	FV = [FV; FZ6_0 ones(size(FZ6_0,1),1)*6.0];
	FV = [FV; FZ6_2 ones(size(FZ6_2,1),1)*6.2];
	FV = [FV; FZ6_4 ones(size(FZ6_4,1),1)*6.4];
	FV = [FV; FZ6_6 ones(size(FZ6_6,1),1)*6.6];
	FV = [FV; FZ6_8 ones(size(FZ6_8,1),1)*6.8];
	FV = [FV; FZ7_0 ones(size(FZ7_0,1),1)*7.0];
	FV = [FV; FZ7_2 ones(size(FZ7_2,1),1)*7.2];
	FV = [FV; FZ7_4 ones(size(FZ7_4,1),1)*7.4];
	FV = [FV; FZ7_6 ones(size(FZ7_6,1),1)*7.6];
	FV = [FV; FZ7_8 ones(size(FZ7_8,1),1)*7.8];

	figure;
	plot(FVClean(:,1), FVClean(:,2), '.');

end

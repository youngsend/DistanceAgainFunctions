function [CutLoc, F] = getCutLocWithMatlabAutocorr(Acc, sample_rate, v , sequence_time)
% I use Matlab Autocorr to get the best lag of a sequence of Acc samples. The window size of the sequence is sequence_time seconds which means we use sample_rate * sequence_time samples. Zee use 2 seconds and I use it at first.
CutLoc = [];
m = size(Acc, 1);
i = 1;
len_sequence = floor(sample_rate * sequence_time);
while (i + len_sequence - 1) <= m
	sequence = Acc(i:i+len_sequence-1);
	auto_corr_compute = autocorr(sequence, len_sequence-1);

%%%%%%%% How to eliminate the outliers?? I say it's very hard for a man to walk less than 1Hz or more than 3Hz (steps per second). Which means I only need lag for (sample_rate/3, sample_rate) to see the max auto corr.
	interval_left = floor((sample_rate) * 0.31);
	interval_right = floor(sample_rate);
	[pks, locs] = findpeaks(auto_corr_compute); 

%%%%%%%% Then I only choose one-step frequency rather than two-step frequency!
	n = size(pks,1);
	j = n;
	while(locs(j) >= interval_right)
		pks(j) = 0;
		j = j - 1;
	end
	j = 1;
	while(locs(j) <= interval_left)
		pks(j) = 0;
		j = j + 1;
	end
	
	[M, MI] = max(pks);
	if ((MI == j) || (locs(MI-1) <= interval_left))
		best_lag = locs(MI);
	else
		MMI = MI - 1;
		while((locs(MI) - locs(MMI) <= interval_left) && (MMI >= j))
			MMI = MMI - 1;
			if (MMI == j - 1)
				MMI = MI;
				break;
			end
		end
		best_lag = locs(MMI);
	end

%%%%%%%%
	CutLoc = [CutLoc; best_lag - 1]; % for example, i = 1, Lag = 40, then I cut before i = 41, which means the slots number is 40!!! I use best_lag - 1, because the index of auto_corr_compute starts from 1.
	i = i + best_lag - 1;
end


n = size(CutLoc, 1);
F = [];
for j = 1:n,
	f = sample_rate / CutLoc(j);
	F = [F; f];
end

%figure;
%plot(CutLoc, '.');
%str = ['Velocity is ', num2str(v), 'km/h; Window Size is ', num2str(sequence_time), 'seconds.'];
%title(str);
end



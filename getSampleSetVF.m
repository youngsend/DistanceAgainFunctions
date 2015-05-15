function F = getSampleSetVF(loc, sample_rate)
% loc is the periodic wave's cuts' locations
% v is the velocity of the wave
% sample_rate is used to compute the duration between locs
m = size(loc, 1);
T = [loc(1:m-2) loc(3:m)]; % every two steps
F = 2 ./ ((T(:,2) - T(:,1)) / sample_rate);




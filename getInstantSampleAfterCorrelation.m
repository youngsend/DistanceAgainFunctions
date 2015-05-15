function [R, RR, RRR, locs, locslocs, locslocslocs] = getInstantSampleAfterCorrelation(acc, v)
% This function is used to get sample of every two steps, instead of an average sample
% v is current velocity number of treadmill.

% First, find a good cut point in acc, I choose 80 points (at least 4 seconds) around the middle one and use the biggest point.
middle = floor(size(acc, 1)/2);
[maxmax, I] = max(acc((middle - 399):(middle + 400)));
cut = middle - 400 + I;

% Second, use Auto Correlation.
R = autoCorrelation(acc, cut);
RR = autoCorrelation(R, cut);
RRR = autoCorrelation(RR, cut);

[pks, locs] = findpeaks(R);
locs = locs(2:end-1);
[pks, locslocs] = findpeaks(RR);
locslocs = locslocs(2:end-1);
[pks, locslocslocs] = findpeaks(RRR);
locslocslocs = locslocslocs(2:end-1);

% I find that R is not a good wave under some velocity, for example, 7.9km/h and 3.9km/h.
% figure;
% plot(R((middle - 1999):(middle + 2000)));
figure;
plot(locs,'b.');
str = ['Velocity is ', num2str(v), 'km/h'];
title(str);
hold on;
plot(locslocs,'r.');
plot(locslocslocs,'m.');
% I need to see whether it's a good wave. How to decide?




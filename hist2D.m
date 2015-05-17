function hist2D(X, Y, xslots_num, yslots_num)
% X is a vector, for example, representing Frequency.
% Y is a vector, for example, representing Velocity.
% Now I'm going to count (x, y) points.
% step means the step between two bins, for example, we choose 0.01Hz as the step for Frequency
% slots_num means how many segments you want cut into at the interval [min, max]

% The following 2 lines: make xbins and ybins adaptive to double type number.
% For example, min(X) = 1.4851, then I start from 1.48 (because 1.4851 * 100 = 148.51, floor(148.51) = 148, 148 / 100 = 1.48). max(X) = 2.7639, then I stop in 2.77 (because 2.7639 * 100 = 276.39, ceil(276.39) = 277, 277 / 100 = 2.77). Step is 0.01.
xstep = (max(X) - min(X)) / xslots_num;
ystep = (max(Y) - min(Y)) / yslots_num;
xbins = ((floor(min(X)/xstep))*xstep):xstep:((ceil(max(X)/xstep))*xstep);
%xbins = ((ceil(max(X)/xstep))*xstep):(-1*xstep):((floor(min(X)/xstep))*xstep);
ybins = ((floor(min(Y)/ystep))*ystep):ystep:((ceil(max(Y)/ystep))*ystep);
%ybins = ((ceil(max(Y)/ystep))*ystep):(-1*ystep):((floor(min(Y)/ystep))*ystep);
xNumBins = numel(xbins); 
yNumBins = numel(ybins);

% Map X and Y values to bin indicies
Xi = round( interp1(xbins, 1:xNumBins, X, 'linear', 'extrap') );
Yi = round( interp1(ybins, 1:yNumBins, Y, 'linear', 'extrap') );

% Count number of elements in each bin
H = accumarray([Yi(:) Xi(:)], 1, [yNumBins xNumBins]);

% Plot 2D histogram
imagesc(xbins, ybins, H);
% In default, Y Direction will reverse, so I make it normal.
set(gca, 'YDir', 'normal');
colormap hot; colorbar;
hold on, plot(X, Y, 'b.', 'MarkerSize', 1);

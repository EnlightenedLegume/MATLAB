function [inds] = peakFind(y)
% Takes x (independent) and y (dependent) data, finds the peaks and returns
% the indices of the peaks

inds = zeros(length(y),1);

for i=5:length(y)-5
    inds(i) = y(i)>y(i+1) & y(i)>y(i+2) & y(i)>y(i+3)   ...
        & y(i)>y(i+4) & y(i)>y(i+5) & y(i)>y(i-1)       ...
        & y(i)>y(i-2) & y(i)>y(i-3) & y(i)>y(i-4) & y(i)>y(i-4);
end
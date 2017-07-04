function [inds, freqs] = freqAxis(x)

numSamples = length(x); % Number of samples
rateSample = nanmedian(diff(x)); % Get the sample rate

if rem(numSamples,2)
    inds = 1:(numSamples+1)/2;
else
    inds = 1:numSamples/2+1;
end

freqs = (inds - 1)'/rateSample/numSamples;
function [freqAx, PSD] = powSpecD(time,data,winm)

[inds,freqAx] = freqAxis(time);

switch(winm)
    case 'h'
        cwin = hanning(length(time));
end

ft = fft(cwin.*(data-nanmean(data)),length(time));
ft = ft(inds);

PSD = abs(ft).^2;


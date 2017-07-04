function [cofsd,synth] = calcSynthFourier(t,d,A,P,phi)
% [corrofsu,synth] = calcSynthFourier(t,data,A,P,phi)
% Produces a superposition of sine waves evaluated at the independent
% variable (t) and calculates their correlation coefficient
%
% INPUT:
% 
% t         The independent variable; e.g. time
% d      The dependent variable; e.g. temperature
% A         Vector of amplitudes; e.g. [1 2 3]
% P         Vector of periods; [0 12 24]
% phi       Vector with phase offsets; e.g. [pi/2 6 pi]
% 
% OUTPUT:
% 
% cofsd  Correlation coefficient between synth and data
% synth     The synthetic superposition

% TESTED ON: 
% WRITTEN BY

% Force everything to column vectors by unwrapping
t = t(:);
d = d(:);
A = A(:);
P = P(:);
phi = phi(:);

% Create actual superposition
synth = sin((2*pi./P').*t+phi')*A;

% Calculate correlation coefficient using MATLAB's corr function
cofsd = corr(synth,d);

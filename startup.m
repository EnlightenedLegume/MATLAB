
% Add paths
path2docs = getenv('DOCUMENTS');
addpath(genpath(fullfile(path2docs,'MATLAB\Functions')));
addpath(fullfile(path2docs,'MATLAB\Packages'));
addpath(genpath(fullfile(path2docs,'MATLAB\Packages\matlab2tikz\src')));

% Set plot defaults
set(0,'DefaultLineLineWidth',1.5);
set(0,'DefaultAxesFontSize',15);


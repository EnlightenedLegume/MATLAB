function [x,y] = errEnvelop(x,data,err)

% Unpack to column vecotrs
x = x(:);
data = data(:);
err = err(:);

% Duplicate x forwards then backwards
x = [x;flipud(x)];
% Get bottom, then top, concat
y = [data-err;flipud(data+err)];
%Handle = fill(x,y(:,1),color);
%Handle.FaceAlpha=.2;Handle.EdgeColor='k';Handle.LineStyle='none';
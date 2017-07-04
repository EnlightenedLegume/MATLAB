function saveFig(fig, fname, mode, varargin)
% Saves figures in a variety of formats and different
% settings. Relies on matlab2tikz for the 'tikz' mode. 
    
% Created by Jake Waksbaum on 13/042017
% Updated by Benjamin Huang on 15/04/2017
%        Removed matlab2tikz options to trim axis left
% Updated by Benjamin Huang on 04/07/2017
%        Generalized function to accept different modes

    
switch mode
  case 'tikz'
    matlab2tikz([fname '.tex'],          ...
                'figurehandle', fig,     ...
                'showInfo', false,       ...
                'parseStrings', false,   ...
                'width', '\figw',        ...
                'height', '\figh',       ...
                varargin{:})
  case 'pdf'
    % Format fig
    if (nargin > 3) 
        % Create parser
        p = inputParser;   
        addParameter(p,'height',800);
        addParameter(p,'width',1050);
        addParameter(p,'left',10);
        addParameter(p,'bottom',10);
        addParameter(p,'orientation','portrait');
        addParameter(p,'type','usletter');
        addParameter(p,'color','w')
    end  
    % Set position
    h = p.Results.height;
    w = p.Results.width;
    l = p.Results.left;
    b = p.Results.bottom;
    fig.PaperPosition = [l b w h];
    % Set orientation
    fig.PaperOrientation = p.Results.orientation;
    % Set paper type
    fig.PaperType = p.Results.type;
    % Set color
    fig.Color = p.Results.color;
    saveas(fig,fname,'pdf');
end

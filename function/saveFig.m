function saveFig(fig, fname, mode, varargin)
% Saves figures in a variety of formats and different
% settings. Relies on matlab2tikz for the 'tikz' mode. 
%
% INPUTS
% saveFig(fig, fname, mode)
%         Saves figure <fig> under the specified file name <fname>,
%         formatted according to the mode <mode>. Note that <fname>
%         should not have the file extension (e.g. .pdf, .tex) as
%         this function will add it, unless a specific extension is
%         needed that is different from the file format's standard
%         extension (e.g. saving an ascii as a .in file). See
%         saveas for more information. See PROPERTIES for default
%         settings. 
% saveFig(fig,fname,mode,Name,Value)
%         Specify properties using Name,Value pair arguments.
%
% PROPERTIES
%         NAME     VALUE TYPE    DESCRIPTION
%         height   double        Height of the figure, in units set
%                                by the 'punits' property. DEF:
%                                26.29 cm
%         width    double        Width of the figure, in units set
%                                by the 'punits' property. DEF:
%                                20.32 cm
%         left     double        Distance from left side of
%                                the paper--ignored by non-paper
%                                formats. DEF: 1.5 cm
%         bottom   double        Distance from the bottom side of
%                                the paper--ignored by non-paper
%                                formats. DEF: 1.5 cm
%         orient   string        Sets the orientation of the
%                                paper--ignored by non-paper
%                                formats. DEF: 'portrait'
%         type     string        Sets the type of paper being
%                                used--ignored by non-paper
%                                formats. DEF: 'usletter'
%         bgcolor  string        Sets the background color of the
%                                figure. DEF: 'w' (white)
%         punits   string        Sets the units for which
%                                measurements are in. DEF:
%                                'centimeters'  
%         fmode    string        Sets the formatting mode. In
%                                'auto' mode, saved figure matches
%                                the displayed figure size (height
%                                and width adjusted) and the figure
%                                is centered on the page. In
%                                'manual' mode, the figure's
%                                PaperPosition property controls
%                                these aspects. DEF: 'manual'                         
% EPS ONLY:
%         color    boolean       Sets the output to a colorized eps
%                                (true) or a greyscale eps
%                                (false). DEF: true

% Created by Jake Waksbaum on 13/04/2017
% Updated by Benjamin Huang on 15/04/2017
%        Removed matlab2tikz options to trim axis left
% Updated by Benjamin Huang on 04/07/2017
%        Generalized function to have different modes


% Parse varargin if a non-tikz option was selected
if (~strcmp(mode,'tikz')) 
    % Create parser
    p = inputParser;  
    % Keep unmatched for specific fields not used by all file types
    p.KeepUnmatched = 1;
    % Add formating parameters 
    addParameter(p,'height',26.29);
    addParameter(p,'width',20.32);
    addParameter(p,'left',1.5);
    addParameter(p,'bottom',1.5);
    addParameter(p,'orient','portrait');
    addParameter(p,'type','usletter');
    addParameter(p,'bgcolor','w')
    addParameter(p,'punits','centimeters');
    addParameter(p,'fmode','manual');
    % Parse arguments
    parse(p,varargin{:});
end


% Enter different modes block
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
    % FORMAT FIGURE
    % Set units
    fig.PaperUnits = p.Results.punits; 
    % Set position
    w = p.Results.width;
    h = p.Results.height;
    l = p.Results.left;
    b = p.Results.bottom;
    fig.PaperPosition = [l b w h];
    % Set orientation
    fig.PaperOrientation = p.Results.orient;
    % Set paper type
    fig.PaperType = p.Results.type;
    % Set color
    fig.Color = p.Results.bgcolor;
    % Set formatting mode
    fig.PaperPositionMode = p.Results.fmode;
    
    % SAVE FIGURE 
    saveas(fig,fname,'pdf');
    
    
  case 'eps'
    % CHECK COLOR OPTION
    colorOpts = {'Color','color','C','c'};
    colorExists = isfield(p.Unmatched,{'Color','color','C','c'});
    if any(colorExists)
        % Check if multiple colors were given. Throw an error if so
        if sum(colorExists) > 1
            error(['Multiple color options were specified under the ' ...
                   'eps mode. Only one color option should be given, ' ...
                   'either as a true or a false']);
        end
        % Get coloring option
        colorBool = p.Unmatched.(colorOpts{colorExists});
    else 
        % Set default to true
        colorBool = 1;
    end
    
    % FORMAT FIGURE
    % Set units
    fig.PaperUnits = p.Results.punits; 
    % Set position
    w = p.Results.width;
    h = p.Results.height;
    fig.PaperPosition = [0 0 w h];
    % Set color
    fig.Color = p.Results.bgcolor;
    % Set formatting mode
    fig.PaperPositionMode = p.Results.fmode;
    
    % SAVE FIGURE
    if colorBool
        saveas(fig,fname,'epsc');
    else 
        saveas(fig,fname,'eps');
    end
end
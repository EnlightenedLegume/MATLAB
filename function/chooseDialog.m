function choice = chooseDialog(name,text,varargin)

    d = dialog('Position',[300 300 250 150],'Name',name);
    txt = uicontrol('Parent',d,'Style','text','Position',[20 80 210 40],...
        'String',text);
    popup = uicontrol('Parent',d,'Style','popup','Position',[75 70 100 25],...
        'String',varargin,'Callback',@popup_callback);
    btn = uicontrol('Parent',d,...
        'Position',[89 20 70 25],...
        'String','Close',...
        'Callback','delete(gcf)');

    choice = varargin{1};

    uiwait(d)

    function popup_callback(popup,event)
              idx = popup.Value;
              popup_items = popup.String;
              choice = char(popup_items(idx,:));
    end
end
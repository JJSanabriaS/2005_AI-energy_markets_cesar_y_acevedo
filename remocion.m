%parametros capa 6
hfc6 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'ListboxTop',0, ...
	'Position',[280 100 87 12], ...
	'String',' ', ...
	'Style','popupmenu', ...
   'Tag','PopupMenu1', ...
   'string','logsig|tansig|hard line',...
   'enable','off',...
   'Callback','fc6=get(hfc6,''value'');', ...   
   'Value',1);

h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'ListboxTop',0, ...
	'Position',[32 100 82.5 12], ...
	'Style','text', ...
	'Tag','StaticText1',...
   'fontname','MS Sans Serif',...
   'fontsize',10,...
   'BackgroundColor',[1 1 1],...
   'HorizontalAlignment','left',...
   'string','Tama�o capa 6');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'ListboxTop',0, ...
	'Position',[175 100 100 12], ...
	'Style','text', ...
	'Tag','StaticText1',...
   'fontname','MS Sans Serif',...
   'fontsize',10,...
   'BackgroundColor',[1 1 1],...
   'HorizontalAlignment','left',...
   'string','F.transferencia capa 6');
htc6 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
	'Position',[124.5 100 24 12], ...
   'Style','popupmenu', ...
   'Tag','PopupMenu1', ...
   'string','1|2|3|4|5|6|7|8|9|10|11|12|13|14|15',...
   'enable','off',...
   'callback','tc6=(get(htc6,''value''));',...
   'Tag','EditText1');

%parametors capa 7

hfc7 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'ListboxTop',0, ...
	'Position',[280 85 87 12], ...
	'String',' ', ...
	'Style','popupmenu', ...
   'Tag','PopupMenu1', ...
   'string','logsig|tansig|hard line',...
   'enable','off',...
   'Callback','fc7=get(hfc7,''value'');', ...   
	'Value',1);
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'ListboxTop',0, ...
	'Position',[32 85 82.5 12], ...
	'Style','text', ...
	'Tag','StaticText1',...
   'fontname','MS Sans Serif',...
   'fontsize',10,...
   'BackgroundColor',[1 1 1],...
   'HorizontalAlignment','left',...
   'string','Tama�o capa 7');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'ListboxTop',0, ...
	'Position',[175 85 100 12], ...
	'Style','text', ...
	'Tag','StaticText1',...
   'fontname','MS Sans Serif',...
   'fontsize',10,...
   'BackgroundColor',[1 1 1],...
   'HorizontalAlignment','left',...
   'string','F.transferencia capa 7');
htc7 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
	'Position',[124.5 85 24 12], ...
   'Style','popupmenu', ...
   'Tag','PopupMenu1', ...
   'string','1|2|3|4|5|6|7|8|9|10|11|12|13|14|15',...
   'enable','off',...
   'callback','tc7=(get(htc7,''value''));',...
   'Tag','EditText1');

%paramteros capa 8
hfc8 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'ListboxTop',0, ...
	'Position',[280 70 87 12], ...
	'String',' ', ...
	'Style','popupmenu', ...
   'Tag','PopupMenu1', ...
   'string','logsig|tansig|hard line',...
   'enable','off',...
   'Callback','fc8=get(hfc8,''value'');', ...   
   'Value',1);
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'ListboxTop',0, ...
	'Position',[32 70 82.5 12], ...
	'Style','text', ...
	'Tag','StaticText1',...
   'fontname','MS Sans Serif',...
   'fontsize',10,...
   'BackgroundColor',[1 1 1],...
   'HorizontalAlignment','left',...
   'string','Tama�o capa 8');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'ListboxTop',0, ...
	'Position',[175 70 100 12], ...
	'Style','text', ...
	'Tag','StaticText1',...
   'fontname','MS Sans Serif',...
   'fontsize',10,...
   'BackgroundColor',[1 1 1],...
   'HorizontalAlignment','left',...
   'string','F.transferencia capa 8');
htc8 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
	'Position',[124.5 70 24 12], ...
   'Style','popupmenu', ...
   'Tag','PopupMenu1', ...
   'string','1|2|3|4|5|6|7|8|9|10|11|12|13|14|15',...   
   'enable','off',...
   'callback','tc8=(get(htc8,''value''));',...
   'Tag','EditText1');


%paramteros capa 9
hfc9 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'ListboxTop',0, ...
	'Position',[280 55 87 12], ...
	'String',' ', ...
	'Style','popupmenu', ...
   'Tag','PopupMenu1', ...
   'string','logsig|tansig|hard line',...
   'enable','off',...
   'Callback','fc9=get(hfc9,''value'');', ...   
   'Value',1);
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'ListboxTop',0, ...
	'Position',[32 55 82.5 12], ...
	'Style','text', ...
	'Tag','StaticText1',...
   'fontname','MS Sans Serif',...
   'fontsize',10,...
   'BackgroundColor',[1 1 1],...
   'HorizontalAlignment','left',...
   'string','Tama�o capa 9');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'ListboxTop',0, ...
	'Position',[175 55 100 12], ...
	'Style','text', ...
	'Tag','StaticText1',...
   'fontname','MS Sans Serif',...
   'fontsize',10,...
   'BackgroundColor',[1 1 1],...
   'HorizontalAlignment','left',...
   'string','F.transferencia capa 9');
htc9 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
	'Position',[124.5 55 24 12], ...
   'Style','popupmenu', ...
   'Tag','PopupMenu1', ...
   'string','1|2|3|4|5|6|7|8|9|10|11|12|13|14|15',...   
   'enable','off',...
   'callback','tc9=(get(htc9,''value''));',...
   'Tag','EditText1');

%paramteros capa 10
hfc10 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'ListboxTop',0, ...
	'Position',[280 40 87 12], ...
	'String',' ', ...
	'Style','popupmenu', ...
   'Tag','PopupMenu1', ...
   'string','logsig|tansig|hard line',...
   'enable','off',...
   'Callback','fc10=get(hfc10,''value'');', ...   
   'Value',1);
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'ListboxTop',0, ...
	'Position',[32 40 82.5 12], ...
	'Style','text', ...
	'Tag','StaticText1',...
   'fontname','MS Sans Serif',...
   'fontsize',10,...
   'BackgroundColor',[1 1 1],...
   'HorizontalAlignment','left',...
   'string','Tama�o capa 10');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'ListboxTop',0, ...
	'Position',[175 40 100 12], ...
	'Style','text', ...
	'Tag','StaticText1',...
   'fontname','MS Sans Serif',...
   'fontsize',10,...
   'BackgroundColor',[1 1 1],...
   'HorizontalAlignment','left',...
   'string','F.transferencia capa 10');
htc10 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
	'Position',[124.5 40 24 12], ...
   'Style','popupmenu', ...
   'Tag','PopupMenu1', ...
   'string','1|2|3|4|5|6|7|8|9|10|11|12|13|14|15',...
   'enable','off',...
   'callback','tc10=(get(htc10,''value''));',...
   'Tag','EditText1');
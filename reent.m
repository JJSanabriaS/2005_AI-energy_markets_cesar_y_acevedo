function fig = reent()

load reent

h0 = figure('Units','points', ...
	'Color',[1 1 1], ...
	'Colormap',mat0, ...
	'FileName','C:\prediccion\reent.m', ...
	'PaperPosition',[18 180 576 432], ...
	'PaperUnits','points', ...
   'Position',[28.5 193.5 420 52.5], ...
   'Tag','Fig2', ...
   'menubar','none',...
   'numbertitle','off',...
   'Name','Parametros del reentrenamiento',...
   'ToolBar','none');

h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'ListboxTop',0, ...
   'Position',[252.75 18.75 102.75 21.75], ...
   'string','adicionar datos',...
   'callback','close,borrado;dos u2,estad',...
	'Tag','Pushbutton1');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'ListboxTop',0, ...
   'Position',[73.5 18.75 102.75 21.75], ...
   'string','modificar parametros',...
   'callback','close,paramet',...
	'Tag','Pushbutton1');
if nargout > 0, fig = h0; end

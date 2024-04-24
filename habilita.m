% creaci�n del menu desplegable tipo de red
hr = uicontrol('Parent',gcf, ...
	'Units','points', ...
	'ListboxTop',0, ...
	'Position',[175 275.5 195 12], ...
	'String',' ', ...
	'Style','popupmenu', ...
   'Tag','PopupMenu1', ...
   'string','Red Elmam|Feed forward|Feed forward en cascada',...
   'Callback','red=get(hr,''value'');', ...
   'enable','off');
% creaci�n menu desplegable funci�n entrenamiento
he = uicontrol('Parent',gcf, ...
	'Units','points', ...
	'ListboxTop',0, ...
	'Position',[175 256.75 195 12], ...
	'String',' ', ...
   'Style','popupmenu', ...
   'string','Algoritmo de gradiente descendente (traingd)|Algoritmo de Leven Marquardt (trainlm)|Algoritmo Back Resilente (trainrp)|Algoritmo gradiente descendente con momento (traingdm)',...
   'Callback','fentre=get(he,''value'');', ...
   'Tag','PopupMenu1', ...
   'enable','off',...
   'Value',fentre);

% creaci�n menu desplegable funci�n aprendizaje
ha = uicontrol('Parent',gcf, ...
	'Units','points', ...
	'ListboxTop',0, ...
	'Position',[175 235 195 12], ...
	'String',' ', ...
   'Style','popupmenu', ...
   'string','Regla de aprendizaje backpropagaci�n|Regla de aprendizaje backpropagaci�n con momento',...
   'Callback','fapre=get(ha,''value'');', ...
   'enable','off',...
	'Tag','PopupMenu1', ...
   'Value',1);
% entrada de dato n�mero de capas
hc = uicontrol('Parent',gcf, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
	'Position',[175 210 24 19.5], ...
   'Style','edit', ...
   'Callback','nc=eval(get(hc,''string''));', ...
   'Tag','EditText1',...
   'enable','off');
% boton de activaci�n de entrada de caracteristicas de capa
hb1 = uicontrol('Parent',gcf, ...
	'Units','points', ...
	'ListboxTop',0, ...
	'Position',[200.25 210 104.25 20.25], ...
   'Tag','Pushbutton1',...
   'string','Guardar',...
   'enable','off',...
   'callback','frame');

set(hr,'enable','on');
set(he,'enable','on');
set(ha,'enable','on');
set(hc,'enable','on');
set(hb1,'enable','on');
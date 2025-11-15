switch nc 
case 1
   set(htc1,'enable','on');
   set(hfc1,'enable','on');
   %set(hper,'enable','on');
case 2
  set(htc1,'enable','on'); set(hfc1,'enable','on')
  set(htc2,'enable','on'); set(hfc2,'enable','on')
  %set(hper,'enable','on');
case 3
  set(htc1,'enable','on'); set(hfc1,'enable','on')
  set(htc2,'enable','on'); set(hfc2,'enable','on')
  set(htc3,'enable','on'); set(hfc3,'enable','on')
  %set(hper,'enable','on');
case 4
  set(htc1,'enable','on'); set(hfc1,'enable','on')
  set(htc2,'enable','on'); set(hfc2,'enable','on')
  set(htc4,'enable','on'); set(hfc4,'enable','on')
  set(htc3,'enable','on'); set(hfc3,'enable','on')
%  set(hper,'enable','on');
case 5
  set(htc1,'enable','on'); set(hfc1,'enable','on')
  set(htc2,'enable','on'); set(hfc2,'enable','on')
  set(htc4,'enable','on'); set(hfc4,'enable','on')
  set(htc3,'enable','on'); set(hfc3,'enable','on')
  set(htc5,'enable','on'); set(hfc5,'enable','on')
  otherwise  
   helpdlg('Numero de capas invalido (debe ser menor o igual a 5)');
end
set(ent,'enable','on');
set(salir,'enable','on');
%parametrosred=[red fentre fapre;fred]
   
clc
tam=size(seriet);
ta=size(pr2);
taman=ta-tam;
pr21=pr2(taman(1)+1:1:ta(1),:);
fechas=dlmread('fechas.txt');
c=dlmread('ciclo.txt');
t=dlmread('tendencia.txt');
tam=size(c);
ct=c.*t(tam(2));
tam=size(ct);
cadena=num2str(dlmread('findatos.txt'));
an=size(cadena);
cadena=cadena(an(1),:);
cadena1=strcat('Predecir_','a partir de_',num2str(ult)); 
%title('Predicción de la señal (real(rojo),calculadas (pesos(verde), sin (amarilla))')
%  set(gcf,'menubar','none');
%  set(gcf,'numbertitle','off');
periodo=questdlg('Desea predecir? Los resultados quedaran en: C:\prediccion\resultprediccion.csv', ...
                         cadena1, ...
                         'Semana Siguiente','Otro','Semana Siguiente');
                      
  switch periodo
  case 'Semana Siguiente'
     ult=num2str(ult)
     if length(ult)==7
        dia=datenum(str2num(ult(1,4:7)),str2num(ult(1,2:3)),str2num(ult(1,1:1)));
     else
        dia=datenum(str2num(ult(1,5:8)),str2num(ult(1,3:4)),str2num(ult(1,1:2)));
     end
tendena=tenden1; close all; tam=size(seriet); tam1=size(seriet1);
while tam1(1)>tam(1)
   seriet1(1,:)=[];
   pesosval(1,:)=[];
   tam1(1)=tam1(1)-1;
end
pr21=[seriet1];
simula=sim(red,pr21);
y=(simula(:,1:1:tam(2)));
y=postmnmx(y,(minserieob),(maxserieob));
[tendena,mint,maxt]=premnmx(tenden1);
t=sim(red,tendena);
y=mean(y);
t=postmnmx(mean(t),(min(mint)),max(maxt));
%t=postmnmx(t,mean(mint),mean(maxt));
respuesta=ciclo.*t.*y;
figure
hold
plot(respuesta,'g');
text(14.5,li+10,vect(1,:)); text(34.5,li+10,vect(2,:)); 
text(64.5,li+10,vect(3,:)); text(84.5,li+10,vect(4,:)); 
text(104.5,li+10,vect(5,:));text(130.5,li+10,vect(6,:));
text(154.5,li+10,vect(7,:));
tam=size(datosentrena);
fecha=num2str(dlmread('findatos.txt'));
an=size(fecha);
fecha=fecha(an(1),:);
ta=size(respuesta);
a=1;
y=[];
for i=1:24:ta(2)
   y(a,:)=respuesta(:,i:1:(tam(2)+i-1));   
   a=a+1;
end
fid=fopen('resultprediccion.csv','w');
fprintf(fid,'dias');
fprintf(fid,',');
for i=1:1:(ta(2)/7)
   vect1=strcat('hora_',num2str(i),',');
   fprintf(fid,vect1);
%   fprintf(fid,'') falta elcorrepondiente a fecha
end
   fprintf(fid,'\r');
clc
for i=1:1:a-1
   dia=dia+1;
   fprintf(fid,datestr(dia));
   fprintf(fid,',');
   for j=1:1:ta(2)/7
   fprintf(fid,num2str(y(i,j)));
   fprintf(fid,',');
end
fprintf(fid,'\r');
end
fclose(fid);
ult=num2str(ult);
     if length(ult)==7
        dia=datenum(str2num(ult(1,4:7)),str2num(ult(1,2:3)),str2num(ult(1,1:1)));
     else
        dia=datenum(str2num(ult(1,5:8)),str2num(ult(1,3:4)),str2num(ult(1,1:2)));
     end
dia=dia+1;
diaf=dia+6;
title('Predicción de la señal RNA (verde)')
set(gcf,'menubar','none');
set(gcf,'numbertitle','off');
set(gcf,'name',strcat('Predicción de la semana posterior a__',' ',fecha,'_','(',datestr(dia),'-',datestr(diaf),')'));
set(gcf,'color',[1 1 1]);
set(gcf,'position',[0 25 650 420]);

h1 = uicontrol(gcf, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'Callback','close', ...
	'ListboxTop',0, ...
	'Position',[80 6 90 14], ...
   'String','Reiniciar proceso', ...
   'Callback','close all,princip',...
   'Tag','Pushbutton1');
 h1 = uicontrol(gcf, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'Callback','close', ...
	'ListboxTop',0, ...
	'Position',[350 6 90 14], ...
   'String','Abandonar', ...
   'Callback','close all,clear all,princip',...
   'Tag','Pushbutton1');
h1 = uicontrol(gcf, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'Callback','close', ...
	'ListboxTop',0, ...
	'Position',[220 6 90 14], ...
   'String','Regresar', ...
   'Callback','close all,presresul',...
   'Tag','Pushbutton1');

case 'Mes Siguiente'
   close all
   fid=fopen('resultprediccion.csv','w');
   fclose(fid);
   figure
   pr22=pr21;
   tendena=tenden1;
   tam=size(seriev);
   if tam(1)< 4
      disp(' debe tomar más datos ya que no hay suficientes')
      close all
      princip;
    else
      for i=1:1:4
      tam=size(ct);
         simula=sim(red,pr21);
         y=simula(:,1:1:tam(2));
         [tendena,mint,maxt]=premnmx(tenden1);         
         t=sim(red,tendena);
         t=postmnmx(t,mean(mint),mean(maxt));
			respuesta=ciclo.*t.*y;
         subplot(2,2,i);
         title(strcat('semana.',num2str(i)))
         hold
         plot(respuesta,'g');
         [tendena,mint,maxt]=premnmx(tendena);  
         tam;
         plot(seriev(i,:).*ct,'r');
         tam=size(datosentrena);
         fecha=num2str(dlmread('findatos.txt'));
         an=size(fecha)
         fecha=fecha(an(1),:);
         tam=size(ct) ;
			set(gcf,'name',strcat('Predicción del mes posterior a__',' ',fecha));
			set(gcf,'color',[1 1 1]);
			set(gcf,'position',[0 25 650 420]);
         pr21(1,:)=[];
         pr22(1,:)=[];
         tenden1(1,:)=[];
         tendena(1,:)=[];
         pr21=[pr21(:,1:1:tam(2));y];
         pr22=[pr22(:,1:1:tam(2));y1];
         tenden1=[tenden1(:,1:1:tam(2));t];
         tendena=[tendena(:,1:1:tam(2));t1];
         [y;y1]; 
      end
   end
      h1 = uicontrol(gcf, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'Callback','close', ...
	'ListboxTop',0, ...
	'Position',[80 6 90 14], ...
   'String','Reiniciar proceso', ...
   'Callback','close all,princip',...
   'Tag','Pushbutton1');

h1 = uicontrol(gcf, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'Callback','close', ...
	'ListboxTop',0, ...
	'Position',[220 6 90 14], ...
   'String','Regresar', ...
   'Callback','close all,presresul',...
   'Tag','Pushbutton1');

 h1 = uicontrol(gcf, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'Callback','close', ...
	'ListboxTop',0, ...
	'Position',[350 6 90 14], ...
   'String','Abandonar', ...
   'Callback','close all,clear all,princip',...
   'Tag','Pushbutton1');

case 'Otro'
   close all
   fid=fopen('resultprediccion.csv','w');
   fclose(fid);
%   figure
pr22=pr21;
tendena1=tenden1;
ult=num2str(ult)
     if length(ult)==7
        dia=datenum(str2num(ult(1,4:7)),str2num(ult(1,2:3)),str2num(ult(1,1:1)));
     else
        dia=datenum(str2num(ult(1,5:8)),str2num(ult(1,3:4)),str2num(ult(1,1:2)));
     end
tendena=tenden1; close all; tam=size(seriet); tam1=size(seriet1);
while tam1(1)>tam(1)
   seriet1(1,:)=[];
   pesosval(1,:)=[];
   tam1(1)=tam1(1)-1;
end
   tam=size(seriev);
   answer=inputdlg('Introduzca un número indicando la cantidad de semanas a avanzar en el tiempo','Semanas a proyectar:');
   semanas=str2num(char(answer));
   for i=1:1:semanas
      tam=size(ct);
      pr21=[seriet1];
simula=sim(red,pr21);
y=(simula(:,1:1:tam(2)));
y=postmnmx(y,(minserieob),(maxserieob));
[tendena,mint,maxt]=premnmx(tenden1);
t=sim(red,tendena);
t=postmnmx(mean(t),(min(mint)),max(maxt));
y=mean(y);
respuesta=ciclo.*t.*y;
         title(strcat('semana.',num2str(semanas)))
         plot(respuesta,'g');hold
         tam;
         plot(respuesta,'g');hold
         tam=size(datosentrena);
         fecha=num2str(dlmread('findatos.txt'));
         an=size(fecha)
         fecha=fecha(an(1),:);
         tam=size(ct) ;
			set(gcf,'name',strcat('Predicción de la semana_',num2str(semanas),'_','posterior a__',' ',fecha));
			set(gcf,'color',[1 1 1]);
			set(gcf,'position',[0 25 650 420]);
         pr21(1,:)=[];
         tendena(1,:)=[];
         pr21=[pr21(:,1:1:tam(2));y];
         tendena=[tendena(:,1:1:tam(2));t];
         dia=dia+7;
        end
        plot(respuesta,'g');hold
        text(14.5,li+10,vect(1,:)); text(34.5,li+10,vect(2,:)); 
text(64.5,li+10,vect(3,:)); text(84.5,li+10,vect(4,:)); 
text(104.5,li+10,vect(5,:));text(130.5,li+10,vect(6,:));
text(154.5,li+10,vect(7,:));
        
      title('predicción obtenida de la RNA ')
      clc
      tam=size(datosentrena); diai=dia-6;
      cadena=strcat(datestr(diai),'-',datestr(dia));
     	set(gcf,'name',strcat('Predicción de la semana_',num2str(semanas),'_','posterior a__',' ',fecha,'_','(',cadena,')'));

   a=1;
y=[];
for i=1:24:ta(2)
   y(a,:)=respuesta(:,i:1:(tam(2)+i-1));   
   a=a+1;
end
fid=fopen('resultprediccion.csv','w');
fprintf(fid,'dias');
fprintf(fid,',');
for i=1:1:(ta(2)/7)
   vect1=strcat('hora_',num2str(i),',');
   fprintf(fid,vect1);
%   fprintf(fid,'') falta elcorrepondiente a fecha
end
   fprintf(fid,'\r');
clc
for i=1:1:a-1
   diai=diai+1;
   fprintf(fid,datestr(diai));
   fprintf(fid,',');
   for j=1:1:ta(2)/7
   fprintf(fid,num2str(y(i,j)));
   fprintf(fid,',');
end

fprintf(fid,'\r');
end
fclose(fid);


   h1 = uicontrol(gcf, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'Callback','close', ...
	'ListboxTop',0, ...
	'Position',[80 6 90 14], ...
   'String','Reiniciar', ...
   'Callback','close all,princip',...
   'Tag','Pushbutton1');

h1 = uicontrol(gcf, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'Callback','close', ...
	'ListboxTop',0, ...
	'Position',[220 6 90 14], ...
   'String','Regresar', ...
   'Callback','close all,presresul',...
   'Tag','Pushbutton1');

 h1 = uicontrol(gcf, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'Callback','close', ...
	'ListboxTop',0, ...
	'Position',[350 6 90 14], ...
   'String','Abandonar', ...
   'Callback','close all,clear all,princip',...
   'Tag','Pushbutton1');
end

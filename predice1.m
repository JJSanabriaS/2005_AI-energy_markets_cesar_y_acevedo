clear serie1a
%title('Predicción de la señal (real(rojo),calculadas (pesos(verde), sin (amarilla))')
% creación de la interfase para realizar la captura de los datos
%set(gcf,'menubar','none');
%set(gcf,'numbertitle','off');
datos=questdlg('Datos a usar?', ...
                         'Datos para predecir', ...
                         'Entrenamiento','Nuevos','Entrenamiento');
% opción de toma de los datos usados en el entrenamiento
 switch datos
   case 'Entrenamiento'
      predice;   
      h1 = uicontrol(gcf, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'Callback','close', ...
	'ListboxTop',0, ...
	'Position',[220 6 90 14], ...
   'String','Regresar', ...
   'Callback','close all,princip',...
   'Tag','Pushbutton1');
   case 'Nuevos'
      close all
      fid=fopen('datospredice.txt','w'); 
      fclose(fid);
      % se borran los archivos que activan el proceso en background
            
fid=fopen('tendencia.txt');  % busqueda
if fid~=-1
   fclose(fid);
	delete('tendencia.txt');  % borrado
end
clear fid;

fid=fopen('pesos.txt');     % busqueda
if fid~=-1
   fclose(fid);
   delete('pesos.txt');     % borrado
end
clear fid

fid=fopen('inicioproc.txt'); % busqueda
if fid~=-1
   fclose(fid);
   delete('inicioproc.txt'); % borrado
end
clear fid

fid=fopen('fechas.txt'); % busqueda
if fid~=-1
   fclose(fid);
delete('fechas.txt');    % borrado
end
clear fid;

% ------------------------------------------------------------------
% ----------------------------------------------------------------
dlmwrite('findatos.txt','');
    dos u3; % lectura de datos de excel
    a=1;
    dlmwrite('inicioproc.txt',a,'\t');
    datospredice=dlmread('datospredice.txt','\t',0,0);
    tamano=size(datospredice);
    if tamano(1)==0
       clc
       disp('No existen datos para entrenar')
       break
    end
    % -------------------------------------------------------------
    %---------------------------------------------------------------
    disp('Espere un momento Matlab esta procesando los datos')
    inclfestivo=dlmread('festivos.txt','\t',0,0);% inclusión de festivos
    inclfestivo=dlmread('festivos.txt','\t',0,0);% inclusión de festivos
disp('Se capturaron los datos basicos')
diainicial=dlmread('findatos.txt','\t',0,0);
dlmwrite('findatos.txt',diainicial,'\t');
    estructu=dlmread('estructura.txt','\t',0,0); % captura de la estructura de datos
    tipof=estructu(1,:);
    tam=size(estructu);
       if tipof==1   % el fichero de datos no incluye fechas
       answer=dlmread('findatos.txt','\t',0,0);
       answer=num2str(answer(1,:));
       
       if length(answer)> 8 
          disp('hay un error en la entrada de la fecha')
          pause
         predice1;
       elseif length(answer)==8
          dia=[answer(1,1),answer(1,2)];
          mes=[answer(1,3),answer(1,4)];
          ano=[answer(1,5),answer(1,6),answer(1,7),answer(1,8)];
       else 
          ano=[answer(1,4),answer(1,5),answer(1,6),answer(1,7)];
          mes=[answer(1,2),answer(1,3)];
          dia=[answer(1,1)];
       end
       
% --------------------------------------------------------------------
       % determinación de las fechas involucradas
       cantdia=tamano(1); % calculo del numero de dias considerados
       ano1=str2num(ano); mes=str2num(mes); 
       dia=str2num(dia);
       dia1=dia;
       for fech1=1:1:cantdia
				   dias(fech1,1)=dia1;  %creación del vector fechas
				   mes1(fech1,1)=mes;      
				   ano2(fech1,1)=ano1;   
				   dia1=dia1+1;    finmes=eomday(ano1,mes);
					  if dia1>finmes
					     dia1=1;     mes=mes+1;
					  end
					  if mes>12
					     ano1=ano1+1;     mes=1;
					  end
				  ano3=num2str(ano2);  
				  dias2=num2str(dias);
              mes2=num2str(mes1);
  %---------------------------------------------------------------%
  % Determinación de las fechas            
 		  (mes2(fech1,:));
		  tam=size(mes2(fech1,:));
       if tam(2)==1
	     mes3(fech1,:)=strcat('0',mes2(fech1,1));
	    else
		    if isspace(mes2(fech1,1))==1
		       mes3(fech1,:)=strrep(mes2(fech1,:),' ','0');
		    else
			    mes3(fech1,:)=strcat(mes2(fech1,1),mes2(fech1,2));
			 end
		 end
   				fechas1=strcat(dias2,mes3,ano3);
			end
		mes3;
		fechas=(fechas1);
      datospredice;
   else
      
    fechas=datospredice(:,1); % separación de las fechas de los datos
    fechas=num2str(fechas); 
    datospredice(:,1)=[];   
	 tamano(2)=tamano(2)-1;
  end
% --------------------------------------------------------------------
%Se organizo la información temporal de los datos
%disp('se organizaron las fechas de manera uniforme')
fechas;
fechassalv=str2num(fechas);
dlmwrite('fechas.txt',fechassalv,'\t');
fechas=num2str(fechas); 
%----------------------------------------------------------------------
%----------------------------------------------------------------------
% Determinación del vector de fechas festivas
	oblig=[101;1903;105;2007;708;812;2412;2512;3112];
   tamanof=size(fechas);
		for i=1:1:tamanof(1)
      	fecha=(fechas(i,:));    
	      n=length(fecha);
   		 if (n==7)  
             ano=str2num(strcat(fecha(4),fecha(5),fecha(6),fecha(7)));
             diames=(strcat(fecha(1),fecha(2),fecha(3)));
	       else 
             ano=str2num(strcat(fecha(5),fecha(6),fecha(7),fecha(8)));
             diames=(strcat(fecha(1),fecha(2),fecha(3),fecha(4)));
          end 
%--------------------------------------------------------------------%  
%Determinación de la pascua de acuerdo al calendario juliano y liturgico
   d1=225-11*mod(ano,19); d=d1; m=1;
   	while d>50 
      	d=d1-m*30;    m=m+1;
	   end
	   E=mod(ano+floor(ano/4)+d+1,7); Q=d+7-E;
	   	if Q>31 
      	 	dia=Q-31;    mes1='04';mes=04;
     	   else
	   	   dia=Q;       mes1='03'; mes=03;
   		end
         dia1=int2str(dia); ano1=int2str(ano); 
         pascua=strcat(dia1,mes1,ano1);
%-----------------------------------------------------------------------------------%
% Ubicación de la semana santa (Lunes-Sabado)
	for k=1:1:6
  		festivo(k)=dia-k;    mesfestivo(k)=mes;    ano;
	   if festivo(k)<=0
   	   mesfestivo(k)=mes-1;       
      	festivo(k)=eomday(ano,mesfestivo(k))+festivo(k);
	   end
	end
%----------------------------------------------------------------------------------
% resto de fiestas religiosas de acuerdo a calendario liturgico
	finmes=eomday(ano,mes)-dia;   
	ascens=39-(finmes+eomday(ano,mes+1));
   		if ascens >= 1
			    ascens;    mesascens=mes+2;
		   else
        	ascens=eomday(ano,mes+1)+ascens;    mesascens=mes+1;
		   end
      	corpus=ascens+21;             mescorpus=mesascens;
	   	if corpus>=eomday(ano,mesascens)
        	corpus=21-(eomday(ano,mesascens)-ascens);    
        	mescorpus=mesascens+1;
	   	end
			sagrad=8+corpus; messagrado=mescorpus;
			if sagrad>eomday(ano,mescorpus)
    	  sagrad=sagrad-eomday(ano,mescorpus); messagrado=mescorpus+1;
			end
		sypd=7+sagrad;		 messyp=messagrado;
		if sypd>eomday(ano,messagrado)
   		sypd=sypd-eomday(ano,messagrado);   messyp=messagrado+1;
		end
      asuncion=43-(eomday(ano,messyp)-sypd); 
      mesasu=messyp+1;
		if asuncion>eomday(ano,messyp)
   		asuncion=43-eomday(ano,messyp+1);    mesasu=messyp+2;
      end
%----------------------------------------------------------------------------------   
%   presentacion festivos
		semanasanta=[festivo;mesfestivo]; pascua; 
		ascension=[ascens;mesascens];
      corpus=[corpus;mescorpus];  
      sagrado=[sagrad;messagrado]; syp=[sypd;messyp];
		asuncion=[asuncion;mesasu]; 
		relig=[ascension,corpus,sagrado,syp,asuncion];
%------------------------------------------------------------------------------------
%	 otras fiestas
		reyes=str2double(strcat('0601',ano1));  
		sjose=str2double(strcat('1903',ano1)); 
      raza=str2double(strcat('1210',ano1));   
      cartag=str2double(strcat('1111',ano1));
		sant=str2double(strcat('111',ano1));
		for k=1:1:5
   		stfestivo1=int2str(relig(:,k));   mes=stfestivo1(2,:);
	   	if mes(1)==' '
   	   	mes=strcat('0',mes(2));
		   end
   		if length(mes)==1
      		mes=strcat('0',mes);
		   end
   	fiestarel(k,:)=str2double(strcat(stfestivo1(1,:),mes,ano1));
		end
%-------------------------------------------------------------------
%ubicación de los festivos de acuerdo a la ley emiliani

emiliani=[reyes;sjose;fiestarel;raza;cartag;sant];
cadena=num2str(emiliani);
 for m=1:1:9
  diames=strcat(cadena(m,3),cadena(m,4),'-',cadena(m,1),cadena(m,2));
  dia(m,:)=str2double(strcat(cadena(m,1),cadena(m,2)));
  emil=(strcat(diames,'-',ano1));   
  [d(m,:),w(m,:)]=weekday(emil);   
  diaf=dia(m,:);
  switch d(m,:)
      case 1
         dia2(m,:)=diaf+1;
      case 2  
         dia2(m,:)=diaf;
	   case 3
			dia2(m,:)=diaf+6;
		case 4
		   dia2(m,:)=diaf+5;
		case 5
			dia2(m,:)=diaf+4;
		case 6
			dia2(m,:)=diaf+3;
		case 7
		   dia2(m,:)=diaf+2;
      end    
   end
%---------------------------------------------------------------
	for m=1:1:9
      mesf(m,:)=str2double(strcat(cadena(m,3),cadena(m,4)));	   
      mes1=mesf(m,:);
		 if dia2(m)>=eomday(ano,mes1)
          dia2(m)=dia2(m,:)-eomday(ano,mesf(m));	   		
          mesf(m,:)=mesf(m,:)+1;
		 end
	end
	diaf2=num2str(dia2);   mesf2=num2str(mesf);
	for m=1:1:7
   	mesf3(m,:)=strcat('0',mesf2(m,2));
	end
	for m=8:1:9
   	mesf3(m,:)=mesf2(m,:);
	end
	for m=1:1:9
   	fechasmoviles(m,:)=strcat(diaf2(m,:),mesf3(m,:),ano1);
	end
%--------------------------------------------------------------------
%arreglo de fiestas sin incluir sujetas a emiliani
	for k=1:1:6
   	stfestivo=int2str(semanasanta(:,k));   mes=stfestivo(2,:);
	   if mes(1)==' '
   	   mes=strcat('0',mes(2));
	   end
   	if length(mes)==1
      	mes=strcat('0',mes);
	   end
%---------------------------------------------------------------
% indexación fiestas colombianas
 fiesta(k,:)=str2double(strcat(stfestivo(1,:),mes,ano1));
 pascua1=str2num(pascua);	   	patrias=int2str(oblig);
 bdfiestas=strcat(patrias,ano1);  bdfiestas=str2num(bdfiestas);
 moviles=str2num(fechasmoviles);	
 bd=[bdfiestas;fiesta;pascua1;moviles];
end
%-----------------------------------------------------------------------------
% Determinación de los pesos
tamano1=size(bd);    
bd=int2str(bd);
	for j=1:1:tamano1(1)
   	fec1=(fechas(i,:));     a(j)=strcmp(fec1,(bd(j,:)));
	   vectro(i,:)=sum(a);
   end
   if vectro(i,:)>=1            
      c(i,1)=0.25;  		% Peso para dias festivos
   else	                
      c(i,1)=1;       % Peso para dias ordinarios  
  end 
%------------------------------------------------------------------
  	if inclfestivo==1	% añadir 
   	c=ones(tamano(1),1);
	end
	end
%---------------------------------------------------------------------------------
	if inclfestivo~=1
   	tama=size(fechas);
		clear w
		for e=1:1:tama(1)
	    ano=strcat(fechas(e,5),fechas(e,6),fechas(e,7),fechas(e,8));
       mes=str2num(strcat(fechas(e,3),fechas(e,4)));
       dia=strcat(fechas(e,1),fechas(e,2));
   		switch  mes 
   			case 1 
			      mes='Jan';
			   case 2
			      mes='Feb';
			   case 3
			      mes='Mar';
			   case 4
			      mes='Apr';
			   case 5
			      mes='May';
			   case 6
			      mes='Jun';
			   case 7
			      mes='Jul';
			   case 8
			      mes='Aug';
			   case 9
			      mes='Sep';
			   case 10
			      mes='Oct';
			   case 11
			      mes='Nov';
			   case 12
			      mes='Dec';
			 end
		   e;		   dia;	   mes;	   ano;
         w=weekday(strcat(dia,'-',mes,'-',ano));
    % Otros pesos para sabados o domingos
      switch w
		   case 7
	        c(e)=0.75;  % sabados
         case 1
          c(e)=0.5;   % domingos
      end
   end
end
disp('se proceso la información temporal')
%--------------------------------------------------------------%
clear tci*
tamano=size(datospredice);
%-------------------------------------------------------------------
%Homogenización de los datos de acuerdo a las unidades
 answer=dlmread('selecunid.txt','\t',0,0); 
  a=size(answer);  answer=answer(a(1));
  clear a
if answer==2
   factor=1000000;
   ulabel='MW';
else if answer==1
      factor=1000;
    ulabel='kW';  
 else factor=1000000000;
    ulabel='GW';
   end
end
unidades=dlmread('unidades.txt','\t',0,0); % captura de datos
tam=size(unidades);
if tam(1)>2
   unidades(1,:)=[];
end
dlmwrite('unidades.txt',unidades,'\t');
unit=size(unidades);

for i=1:1:unit(1)
   unidades(i)=unidades(i)./factor;
end
fechasdatos=dlmread('findatos.txt','\t',0,0);
feta=size(fechassalv);
fechata=size(fechasdatos);
j=1;
k=1;
while k<=feta(1)
   for i=1:1:fechata(1)
      posicion(i,k)=strcmp(num2str(fechassalv(k)),num2str(fechasdatos(i)));
   end
   k=k+1;
end
[i,j]=find(posicion);
k=1;
if fechata(1)~=1
for i=1:2:(fechata(1))
   datosentre(j(i):1:j(i+1),:)=datosentre(j(i):1:j(i+1),:).*unidades(k);
   k=k+1;
end
else
   datosentre=datosentre*unidades;
end
%------------------------------------------------------------------
%manejo de los datos de carga
	for i=1:1:tamano(1)
   	 for j=1:tamano(2)
          tci1(i,j)=datospredice(i,j);
		 end
	end
   media=mean(tci1); desv=std(tci1); 
   cota=2.5*desv;  inf=abs(media-cota);  sup=abs(media+cota);
for i=1:1:tamano(1)
   	 for j=1:tamano(2)
      	 if  (lt(tci1(i,j),inf(j)))|(gt(tci1(i,j),sup(j)))
         	 tci1(i,j)=media(j); 
	       end
          tci2(i,:)=tci1(i,:); % 
       end
    end
  %variable bandera para verificar 
size(c);
d=ones(ans(1),24);
for i=1:1:ans(1)
   d(i,:)=c(i).*ones(1,24);
end
dlmwrite('pesos.txt',d,'\t');
c1=d;
disp('se verifico la uniformidad de los datos')
%disp('se ponderaron los datos de entrenamiento tci2')
tamano=size(datospredice);
procentajeentrena=round(tamano(1)*0.8);
a=round((tamano(1)-procentajeentrena)/7)*7;
procentajeentrena=tamano(1)-a; 

%a=floor(tamano(1)/7)*7;
%datos=(tamano(1)-a)+1;
clear k datospre* datosob* pesospr* pesosob*
k=1;
for i=1:1:procentajeentrena
   datospredice(k,:)=tci2(i,:);
   pesospredice(k,:)=d(i,:);
   k=k+1;
end
k=1;
for i=1+procentajeentrena:1:tamano(1)
      datosobj(k,:)=tci2(i,:);  
      pesosobj(k,:)=d(i,:);
	   k=k+1;
	end
   

disp('se iniciara la creacion de las series')
clear corp* mescorp* messa* E Q fec m media n sagrad sypd ta tam tipof
clear diam* d e q pascua* festivo* mesfest* finmes asce* mes asce* w
clear relig mesf diaf2 dias diacero len ano* mes* dia* fecha oblig
clear emil* cadena fiestarel semanasa* ascen* corpus sagrado syp asuncion
clear mesdi* desv cota inf sup c1 ciclo1 k i j
clear stfesti* mes* reyes sjo* raza cartag sant mes e  
clear fiest* pascuas patrias bdfiestas bd moviles a c 
% incio de las series semanales

linf1=linf;
inicio=num2str(fechas(linf1,:));var=length(inicio);
% determinación de las caracteristicas de la fecha
if var==7  %estructura dia inicial ej 1031997 --dmmaaaa
   mes=str2num(strcat(inicio(2),inicio(3))); %toma del dato del mes
   switch  mes % paso de numero a cadena 
   			case 1 
			      mes='Jan';
			   case 2
			      mes='Feb';
			   case 3
			      mes='Mar';
			   case 4
			      mes='Apr';
			   case 5
			      mes='May';
			   case 6
			      mes='Jun';
			   case 7
			      mes='Jul';
			   case 8
			      mes='Aug';
			   case 9
			      mes='Sep';
			   case 10
			      mes='Oct';
			   case 11
			      mes='Nov';
			   case 12
			      mes='Dec';
            end
   diainic=strcat(num2str(linf1),'-',mes,'-',inicio(4),inicio(5),inicio(6),inicio(7));   
else  %día inicial es ej 12031997 --ddmmaaaa 
   mes=str2num(strcat(inicio(3),inicio(4)));
   switch  mes 
   			case 1 
			      mes='Jan';
			   case 2
			      mes='Feb';
			   case 3
			      mes='Mar';
			   case 4
			      mes='Apr';
			   case 5
			      mes='May';
			   case 6
			      mes='Jun';
			   case 7
			      mes='Jul';
			   case 8
			      mes='Aug';
			   case 9
			      mes='Sep';
			   case 10
			      mes='Oct';
			   case 11
			      mes='Nov';
			   case 12
			      mes='Dec';
            end
%con el mes pasamos a deteminar la cadena ej 12-Mar-1997
diainic=strcat(num2str(linf1),'-',mes,'-',inicio(5),inicio(6),inicio(7),inicio(8));            
end
diainic;
[d,e]=weekday(diainic); % determinamos el dia de la semana de la fecha inicial
switch d % estructuramos las etiquetas para las graficas
case 1  % es Domingo
   vect=['Dom';'Lun';'Mar';'Mie';'Jue';'Vie';'Sab'];
case 2  % Lunes
   vect=['Lun';'Mar';'Mie';'Jue';'Vie';'Sab';'Dom'];
case 3  % MArtes
   vect=['Mar';'Mie';'Jue';'Vie';'Sab';'Dom';'Lun'];
case 4  % Miercoles
   vect=['Mie';'Jue';'Vie';'Sab';'Dom';'Lun';'Mar'];
case 5  % JUeves
   vect=['Jue';'Vie';'Sab';'Dom';'Lun';'Mar';'Mie'];
case 6  % Viernes
   vect=['Vie';'Sab';'Dom';'Lun';'Mar';'Mie';'Jue'];
case 7  % Sabado
   vect=['Sab';'Dom';'Lun';'Mar';'Mie';'Jue';'Vie' ];
end
%-----------------------------------------------------------------%
% Agrupamiento de los datos por semanas
c=0;d=0;
linf1=1;
lsup=(tamano(1)-datos)+1;
% la serie y los pesos de datos de entrenamiento se organizan por semanas 
for b=linf1:7:lsup
   seriepre=datospredice(b,:);         
   pesospre=pesospredice(b,:);
   for a=1+b:1:7+b-1
       seriepre=[seriepre datospredice(a,:)]; 
       pesospre=[pesospre pesospredice(a,:)];
		end
    d=d+1;  serie1p(d,:)=seriepre ;   pesos1p(d,:)=pesospre;     c=c+7;
      end
     clear pesospre
%-----------------------------------------------------------------%
%Determinación de los maximos valores para determinar limites de graf   
% determinación del par de máximos y mínimos
ls=minmax(transpose(serie1p));	li=minmax(transpose(serie1p));
% determinación del valor máximo y mínimo
ls=max(ls);ls=max(ls);			li=min(li);li=min(li);
% creación de un archivo vacio de tendencia para deshabilitar la interfase
% creada con Delphi
tendencia=0;
dlmwrite('tendencia.txt',tendencia,',');  
clear tendencia
%------------------------------------------------------------------%
% Graficas de los datos por semanas y su perfil medio
	figure;   							     subplot(2,1,1);
   tam=size(transpose(serie1p));       larg=tam(1);
   plot(transpose(serie1p));           axis([0 larg li ls]);
   ylabel(ulabel);                      xlabel('Hora de la semana');
   title('datos de entrenamiento');   grid;
	subplot(2,1,2); 					     media=mean((serie1p));
   tam=size((media));					  largo=tam(2);
   ls=minmax(media);						  li=minmax(media);
   ls=max(ls);								  li=min(li);
   plot(media);							  axis([0 larg li ls]);
   ylabel(ulabel);                      xlabel('Hora de la semana');
	title('ciclo');      grid;
	set(gcf,'name','datos de entrenamiento');
   set(gcf,'menubar','none');         set(gcf,'color',[1 1 1]);
   set(gcf,'position',[0 35 650 420]);    
   % colocación de las etiquetas de días
   text(14.5,li+10,vect(1,:)); text(34.5,li+10,vect(2,:)); 
   text(64.5,li+10,vect(3,:)); text(84.5,li+10,vect(4,:)); 
   text(104.5,li+10,vect(5,:));text(130.5,li+10,vect(6,:));
   text(154.5,li+10,vect(7,:));
   % determinación del ciclo y salvado del ciclo
  ciclo=media; 
  disp('espere unos instantes')
  dlmwrite('ciclo.txt',ciclo,',');  
%-------------------------------------------------------------------%
%Recuperación de la tendencia
%-------------------------------------------------------------------- 
tamano=size(serie1p);
seriecompletap=[];
% estructuración de la serie de datos
for a=1:1:tamano(1)
   seriecompletap=[seriecompletap serie1p(a,:)];
 %  pesosdefent=[pesosdefent pesos1(a,:)];
end
% toma de datos del tiempo 
tamano=size(seriecompletap);
horas=1;
for hor=2:1:tamano(2)
      horas=[horas hor];
   end
   clc
% interface determinadora del tipo de tendencia a usar
% tipotend=questdlg('A que comportamiento desea ajustar la tendencia?', ...
 %                       'ajuste tendencia', ...
 %                       'Lineal','Cuadratica','Logaritmica','Logaritmica');
 %switch tipotend
 %  case 'Lineal'
   [coef,s]=polyfit(horas,seriecompletap,1); % ajuste a una recta
   tendencia=polyval(coef,horas);   
 %   case 'Cuadratica'
   [coef,s]=polyfit(horas,seriecompletap,2); % ajuste a curva
   tendencia=polyval(coef,horas);
%   case 'Logaritmica'
      datosalog=[];   
   datosalog1=log10(seriecompletap); % determinación de los log de los datos
   horasalog=log10(horas); 
   coef=polyfit(horasalog,datosalog1,1); % ajuste a recta
   tendencia=polyval(coef,horasalog);
   tendencialog=exp(tendencia);
     ass=[s1.normr;s2.normr;s3.normr];   
   % busqueda del mayor los coeficientes estan entre 0 y 1
   maxass=num2str(min(ass));  ass=num2str(ass);   tam=size(ass);
   ta=size(maxass);  
   while ta(2)<tam(2)
    maxass=[' ' maxass];    ta=size(maxass);
   end
   pos=strmatch(maxass,ass);
   switch pos
   case 1
      tipotend='Lineal'      ;     tendencia=tendencialin;
   case 2
      tipotend='Cuadratica';      tendencia=tendenciac;
   case 3
      tipotend='Logaritmica';      tendencia=tendencialog;
   end
   
%end
% salvado de la tendencia
dlmwrite('tendencia.txt',tendencia,',');
%------------------------------------------------------------------%
clear ci1 ci cicloa1
ciclo;
%------------------------------------------------------------------%
% Grafica de la tendencia y el ciclo obtenido
	figure
	set(gcf,'name','tendencia extraida de los datos de entrenamiento');
   set(gcf,'menubar','none');
   set(gcf,'color',[1 1 1]);
   set(gcf,'position',[0 35 650 420])
   larg=size(tendencia);
ls=minmax((tendencia));   li=minmax((tendencia));
ls=max(ls);							     li=min(li);
plot(tendencia);		
axis([0 larg(2) li ls]);
   title('Tendencia');grid;
    switch tipotend
   case 'Lineal'
      ylabel(ulabel)
      xlabel('Horas')
    case 'Cuadratica'
       ylabel(ulabel);
       xlabel('Horas')
    case 'Logaritmica'
       ylabel('log MW')
      xlabel('Horas')
     end
%-----------------------------------------------------------------%
% Determinación de la irregularidad de los datos
tamano=size(serie1p);
ciclodef=[];
disp('se inicio la deteccion de la irregularidad')
ciclo1=ciclo;
for a=1:1:tamano(1)
   ciclodef=[ciclodef ciclo1];
end
   ct=ciclodef.*tendencia;
	tamano=size(serie1p);
   irregularidad=seriecompletap./ct;
   % Suavizado irregularidad
   Botonexp=questdlg('Desea suavizar la irregularidad exponencialmente?', ...
                         'Suavizado exponencial', ...
                         'Si','No','Si');
switch Botonexp,
  case 'Si'    		% suavizado exponencial
   tamano=size(seriecompletap); pr2=[];
   alfa=50/(tamano(2)+1);      % determinación de la cte alfa
   pr2(1,1)=irregularidad(1,1);
    for i=2:1:tamano(2)
      pr2(1,i)=alfa*irregularidad(1,i)+(1-alfa)*pr2(1,i-1);
    end
disp('se suavizo exponencialmente la componente irregularidad (datos entrenamiento)')
case 'No',
   pr2=irregularidad;
end 
disp('Se descompuso la serie')
%----------------------------------------------------------------%
% Grafica de la componente de irregularidad
tamano=size(irregularidad);
larg=tamano(2);
figure
	set(gcf,'name','irregularidad de los datos');
   set(gcf,'menubar','none');
   set(gcf,'color',[1 1 1]);
   set(gcf,'position',[0 35 650 420])
   subplot(2,1,1);
   ls=minmax((irregularidad));        li=minmax((irregularidad));  
   ls=max(ls);							     li=min(li);
   ls=max(ls); %limites nax 
   li=min(li); % limites min de la irreg
   plot((irregularidad));       axis([0 larg li ls]);
   xlabel('Horas');
   title('irregularidad');grid;
   subplot(2,1,2);
   ls=minmax((pr2));     li=minmax((pr2));  
   ls=max(ls);			    li=min(li);
   ls=max(ls); %limites nax 
   li=min(li); % limites min de la irreg
   plot((pr2));      axis([0 larg li(1) ls(1)]);
   xlabel('Horas');
   switch Botonexp
   case 'Si'
   title('irregularidad suavizada exponencialmente');grid;
   %etiquetas con los días correspondientes
   text(14.5,li(1)+0.1,vect(1,:));text(34.5,li(1)+0.1,vect(2,:));
   text(64.5,li(1)+0.1,vect(3,:));  text(84.5,li(1)+0.1,vect(4,:));
   text(104.5,li(1)+0.1,vect(5,:)); text(130.5,li(1)+0.1,vect(6,:));
   text(154.5,li(1)+0.1,vect(7,:));
   
	case 'No'  
   title('irregularidad ');grid;
   %etiquetas con los días correspondientes
   text(14.5,li(1)+0.1,vect(1,:));text(34.5,li(1)+0.1,vect(2,:));
   text(64.5,li(1)+0.1,vect(3,:));  text(84.5,li(1)+0.1,vect(4,:));
   text(104.5,li(1)+0.1,vect(5,:)); text(130.5,li(1)+0.1,vect(6,:));
   text(154.5,li(1)+0.1,vect(7,:));
end
%----------------------------------------------------------------------
%Recuperación de los datos de entrenamiento   
recuperacion=questdlg('Desea observar la recuperación de la señal', ...
                        'Recuperación', ...
                        'Si','No','No');
switch recuperacion   
  case 'Si' % grafica de los datos orig,serie compuesta y superposición
  figure 
  set(gcf,'name','Recuperación de la serie');
  set(gcf,'menubar','none');
  set(gcf,'color',[1 1 1]);
  set(gcf,'position',[0 35 650 420])
  recuperacio=pr2.*ct;
  subplot(3,1,1);
  larg=size(recuperacio);
  ls=minmax((recuperacio));           li=minmax((recuperacio));  
  ls=max(ls);							     li=min(li);
  ls=max(ls); %limites nax 
  li=min(li); % limites min de la irreg
  plot(recuperacio,'r');axis([0 larg(2) li ls]);ylabel(ulabel);
  title('serie obtenida de la recomposicion')
  subplot(3,1,2)
  ls=minmax((seriecompletap));        li=minmax((seriecompletap));  
  ls=max(ls);							    li=min(li);
  ls=max(ls); %limites nax 
  li=min(li);
  plot(seriecompletap);axis([0 larg(2) li ls]);ylabel(ulabel);
  title('serie original');             subplot(3,1,3)
  plot(recuperacio,'r');              hold
  plot(seriecompletap);axis([0 larg(2) li ls]);ylabel(ulabel);
  title('superposición')
end
xlabel('Horas');
%----------------------------------------------------------------%
% Generación de los archivos
tam=size(pesos1p); re=size(pr2); a=1; b=tam(2); i=1;
pr21=zeros(re(2)/tam(2),tam(2));
while b<=re(2) 
 pr21(i,:)=pr2(1,a:1:b);
 i=i+1; a=a+tam(2); b=b+tam(2);
end
 	pra=minmax(pr21);
	dlmwrite('tendencia.txt',tendencia,',');
	dlmwrite('ciclo.txt',ciclo,',');
   dlmwrite('irrtot.txt',pr21,',');
  dlmwrite('pesosent.txt',pesos1p,',')
  dlmwrite('mmaxirent.txt',pra,',');
  %  red neuronal
  tama=size(seriet);
  ta=size(serie1p);
    if ta(1)<tama(1)
     disp('se reentrenara la red    ')
  %   pause
     periodo=7; nsal=1;
% parametros para la RNA
switch parametrosred(1,2)   
case 1, fentrena='trainbr';
case 2, fentrena='traingd';
case 3, fentrena='trainlm';
case 4, fentrena='trainrp';
case 5, fentrena='traingdm';
end
	if parametrosred(1,3)==1
   	faprendiza='learngd';
   else 
      faprendiza='learngdm';
	end
numerocapas=(parametrosred(1,4));
for a=1:1:numerocapas
   tamanocapa(a)=parametrosred(2,a);
   funcion(a)=parametrosred(2,8+a);
end
pr2=serie1p;
pesos1=pesos1p;
% Toma de los datos de entreamiento y preparación
[p,q]=size(pr2);
ttrain=floor(0.8*p);
for i=1:1:ttrain
   seriet(i,:)=pr2(i,:);  % 80% de los datos usados para el entrenam
   pesosseriet(i,:)=pesos1(i,:);
end
k=1;
clear seriev pesosseriev;
for i=ttrain+1:1:p
   seriev(k,:)=pr2(i,:); % resto de los datos de entrenam
   pesosseriev(k,:)=pesos1(i,:);
   k=k+1;
end
[serieen,minserien,maxserien,serieob,minserieob,maxserieob]=premnmx(seriet,seriev);
seriet1=[serieen pesosseriet]; % se va a entrenar con todos los datos
seriev1=[serieob pesosseriev]; % 20% de los datos del entrenamiento
tsal=size(seriev);
nsal=tsal(1);

% Caracteristicas de las redes neuronales

if parametrosred(1) ==1 
    tipored='newelm';
    red=newelm(minmax(serieen),[tamanocapa nsal]);
elseif parametrosred(1)==2
   tipored='newff';
   red=newff(minmax(serieen),[tamanocapa nsal]);
elseif parametrosred(1)==3
   tipored='newcf';
   red=newcf(minmax(serieen),[tamanocapa nsal]);
else tipored='newfftd';
   red=newfftd(minmax(serieen),[tamanocapa nsal]);
end
% carga de la función de entrnamiento
red.trainFcn=fentrena; 
% icialización de las capas
red.initFcn='initlay';     
    for i=1:1:numerocapas       										  
net.layers{i}=tamanocapa(i); 
net.layers{i}.initfcn='initnw';
funcion(i);
if funcion(i)==1 red.layers{i}.transferFcn='logsig';
elseif funcion(i)==2 red.layers{i}.transferFcn='tansig';
else red.layers{i}.transferFcn='purelin';
    end
 end 		
    figure
    % epocas
red.trainParam.epochs = epocas;  				
red.trainParam.goal = goal;  				
red.trainParam.lr=lr; 
red.performfcn='msereg'; % regularización de la red
red.performparam.ratio=0.5;
minmax(seriet);

% inicialización de la red
red=init(red);
[red,tr1]=train(red,serieen,(serieob)); % datos completos +pesos
figure
%---------------------------------------------------------------------%
% Revisión del comportamiento luego del entrenamiento 
epoca=tr1.epoch;

cadena=num2str(dlmread('findatos.txt'));
cadena1=strcat('Predecir_','a partir de_',cadena); 
periodo=questdlg('Desea predecir?', ...
                         cadena1(1,:), ...
                         'Semana Siguiente','Otro','Semana Siguiente');
                      
  switch periodo
case 'Semana Siguiente'
   close all
   
yp=sim(red,seriet1);
%y1p=sim(red1,serie1p);
tam=size(serie1p);
yp=postmnmx(yp(:,1:1:tam(2)),minserieob,maxserieob);
respuesta=ct(:,1:1:tam(2)).*mean(yp(:,1:1:tam(2)));
figure; hold;
plot(respuesta);
%respuesta1=ct(:,1:1:tam(2)).*y1p(:,1:1:tam(2));
%plot(respuesta1,'g');
tam=size(datosentrena);
fecha=num2str(dlmread('findatos.txt'));
title('Predicción de la señal(calculadas (pesos, sin pesos(verde))')
set(gcf,'menubar','none');
set(gcf,'numbertitle','off');
fecha=fecha(2,:);
set(gcf,'name',strcat('Predicción de la semana posterior a__',' ',fecha));
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
   'Callback','close all,clear all',...
   'Tag','Pushbutton1');
h1 = uicontrol(gcf, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'Callback','close', ...
	'ListboxTop',0, ...
	'Position',[220 6 90 14], ...
   'String','Regresar', ...
   'Callback','close all,decis',...
   'Tag','Pushbutton1');

case 'Mes1 Siguiente'
   close all
   figure
   serie2p=serie1p;
      for i=1:1:4
      tam=size(serie1p);
         simula=sim(red,[serie1p pesos1p]);
			respuesta=ct(:,1:1:tam(2)).*y(:,1:1:tam(2));
         subplot(2,2,i);
         title(strcat('semana.',num2str(i)))
         hold
         plot(respuesta,'g');
         simula1=sim(red1,serie1p);
         respuesta1=ct(:,1:1:tam(2)).*y1(:,1:1:tam(2));
         plot(respuesta1,'y');
         tam=size(datosentrena);
         fecha=num2str(dlmread('findatos.txt'));
         tam=size(serie1p) ;
			set(gcf,'name',strcat('Predicción del mes posterior a__',' ',fecha));
			set(gcf,'color',[1 1 1]);
			set(gcf,'position',[0 25 650 420]);
		   serie1p(1,:)=[];
         serie2p(1,:)=[];
         serie1p=[serie1p(:,1:1:tam(2));y(:,1:1:tam(2))];
         serie2p=[serie2p(:,1:1:tam(2));y1(:,1:1:tam(2))];
         [y;y1]; 
      end
   %end
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
   'Callback','close all,decis',...
   'Tag','Pushbutton1');

 h1 = uicontrol(gcf, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'Callback','close', ...
	'ListboxTop',0, ...
	'Position',[350 6 90 14], ...
   'String','Abandonar', ...
   'Callback','close all,clear all',...
   'Tag','Pushbutton1');

case 'Otro1'
   close all
%   figure
   serie2p=serie1p;
   tam=size(serie1p);
   answer=inputdlg('Introduzca la cantidad de semanas a avanzar en el tiempo','Semanas a proyectar:');
   semanas=str2num(char(answer));
   for i=1:1:semanas
      tam=size(serie1p);
         simula=sim(red,[serie1p pesos1p]);
			respuesta=ct(:,1:1:tam(2)).*y(:,1:1:tam(2));
         title(strcat('semana.',num2str(semanas)))
         plot(respuesta,'g');hold
         simula1=sim(red1,serie1p);
         respuesta1=ct(:,1:1:tam(2)).*y1(:,1:1:tam(2));
         plot(respuesta,'g');hold
         plot(respuesta1,'y');
         tam=size(serie1p);
         fecha=num2str(dlmread('findatos.txt'));
         tam=size(serie1p) ;
			set(gcf,'name',strcat('Predicción de la semana_',num2str(semanas),'_','posterior a__',' ',fecha));
			set(gcf,'color',[1 1 1]);
			set(gcf,'position',[0 25 650 420]);
         serie1p(1,:)=[];
         serie2p(1,:)=[];
         serie1p=[serie1p(:,1:1:tam(2));y(:,1:1:tam(2))];
         serie2p=[serie2p(:,1:1:tam(2));y1(:,1:1:tam(2))];
         [y;y1]; 
      end
      plot(respuesta,'g');hold
      plot(respuesta1,'y');
      title('predicción obtenida de la red verde(con pesos) amarilla (sin pesos)')
      clc
   
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
   'Callback','close all,decis',...
   'Tag','Pushbutton1');
   
   h1 = uicontrol(gcf, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'Callback','close', ...
	'ListboxTop',0, ...
	'Position',[350 6 90 14], ...
   'String','Abandonar', ...
   'Callback','close all,clear all',...
   'Tag','Pushbutton1');
end
    
  else
     a=ta(1)-tama(1);
     for i=1:1:a
        serie1p(1,:)=[];
        pesos1p(1,:)=[];
     end
   cadena=num2str(dlmread('findatos.txt'));
  tam=size(cadena);
cadena1=strcat('Predecir_','a partir de_',cadena(tam(1),:)); 
     periodo=questdlg('Desea predecir?', ...
                         cadena1, ...
                         'Semana Siguiente','Otro','Semana Siguiente');
                      
  switch periodo
case 'Semana Siguiente'
close all
yp=sim(red,[serie1p pesos1p]);
y1p=sim(red1,serie1p);
tam=size(serie1p);
respuesta=ct(:,1:1:tam(2)).*yp(:,1:1:tam(2));
figure; hold;
plot(respuesta);
respuesta1=ct(:,1:1:tam(2)).*y1p(:,1:1:tam(2));
plot(respuesta1,'g');
tam=size(datosentrena);
fecha=num2str(dlmread('findatos.txt'));
title('Predicción de la señal(calculadas (pesos, sin pesos(verde))')
set(gcf,'menubar','none');
set(gcf,'numbertitle','off');
fecha=fechas(1,:);
set(gcf,'name',strcat('Predicción de la semana posterior a__',' ',fecha));
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
   'Callback','close all,clear all',...
   'Tag','Pushbutton1');
h1 = uicontrol(gcf, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'Callback','close', ...
	'ListboxTop',0, ...
	'Position',[220 6 90 14], ...
   'String','Regresar', ...
   'Callback','close all,decis',...
   'Tag','Pushbutton1');

case 'Mes Siguiente'
   close all
   figure
   serie2p=serie1p;
      for i=1:1:4
      tam=size(serie1p);
         simula=sim(red,[serie1p pesos1p]);
			respuesta=ct(:,1:1:tam(2)).*y(:,1:1:tam(2));
         subplot(2,2,i);
         title(strcat('semana.',num2str(i)))
         hold
         plot(respuesta,'g');
         simula1=sim(red1,serie1p);
         respuesta1=ct(:,1:1:tam(2)).*y1(:,1:1:tam(2));
         plot(respuesta1,'y');
         tam=size(datosentrena);
         fecha=num2str(dlmread('findatos.txt'));
         tam=size(serie1p) ;
			set(gcf,'name',strcat('Predicción del mes posterior a__',' ',fecha));
			set(gcf,'color',[1 1 1]);
			set(gcf,'position',[0 25 650 420]);
		   serie1p(1,:)=[];
         serie2p(1,:)=[];
         serie1p=[serie1p(:,1:1:tam(2));y(:,1:1:tam(2))];
         serie2p=[serie2p(:,1:1:tam(2));y1(:,1:1:tam(2))];
         [y;y1]; 
      end
   %end
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
   'Callback','close all,decis',...
   'Tag','Pushbutton1');

 h1 = uicontrol(gcf, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'Callback','close', ...
	'ListboxTop',0, ...
	'Position',[350 6 90 14], ...
   'String','Abandonar', ...
   'Callback','close all,clear all',...
   'Tag','Pushbutton1');

case 'Otro'
   close all
%   figure
   serie2p=serie1p;
   tam=size(serie1p);
   answer=inputdlg('Introduzca la cantidad de semanas a avanzar en el tiempo','Semanas a proyectar:');
   semanas=str2num(char(answer));
   for i=1:1:semanas
      tam=size(serie1p);
         simula=sim(red,[serie1p pesos1p]);
			respuesta=ct(:,1:1:tam(2)).*y(:,1:1:tam(2));
         title(strcat('semana.',num2str(semanas)))
         plot(respuesta,'g');hold
         simula1=sim(red1,serie1p);
         respuesta1=ct(:,1:1:tam(2)).*y1(:,1:1:tam(2));
         plot(respuesta,'g');hold
         plot(respuesta1,'y');
         tam=size(serie1p);
         fecha=num2str(dlmread('findatos.txt'));
         tam=size(serie1p) ;
			set(gcf,'name',strcat('Predicción de la semana_',num2str(semanas),'_','posterior a__',' ',fecha));
			set(gcf,'color',[1 1 1]);
			set(gcf,'position',[0 25 650 420]);
         serie1p(1,:)=[];
         serie2p(1,:)=[];
         serie1p=[serie1p(:,1:1:tam(2));y(:,1:1:tam(2))];
         serie2p=[serie2p(:,1:1:tam(2));y1(:,1:1:tam(2))];
         [y;y1]; 
      end
      plot(respuesta,'g');hold
      plot(respuesta1,'y');
      title('predicción obtenida de la red verde(con pesos) amarilla (sin pesos)')
      clc
   
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
   'Callback','close all,decis',...
   'Tag','Pushbutton1');

 h1 = uicontrol(gcf, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'Callback','close', ...
	'ListboxTop',0, ...
	'Position',[350 6 90 14], ...
   'String','Abandonar', ...
   'Callback','close all,clear all',...
   'Tag','Pushbutton1');
end
    
  end
%--------------------------------------------------------------------     
end


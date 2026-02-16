close all
clear tenden* ciclo* irreg* hor* coef*
tamano=size(datosentre);
% ------------------------------------------------------------------
% ------------------------------------------------------------------
%PREPARACIÓN DE LOS DATOS DE ENTRENAMIENTO
%-------------------------------------------------------------------%
% Determinación de la fecha inicial corrspondiente a una cantidad de 
% dias multiplos de siete
linf=(procentajeentrena-floor(procentajeentrena/7)*7);
% determinación de la fecha final
lsup=linf+floor(procentajeentrena/7)*7;
c=linf; d=0;linf1=1+linf;
% creación de un vector para albergar los datos 
serie1=ones(floor((procentajeentrena-7)/7),tamano(2)*7);
vector=procentajeentrena/7;
% apertura del archivo de fechas
fechas=dlmread('fechas.txt');
% toma del dia inicial a partir de donde se incia la semana
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
% la serie y los pesos de datos de entrenamiento se organizan por semanas 
for b=linf1:7:lsup
   serie=datosentrena(b,:);         
   pesosen=pesosentrena(b,:);
%   tendenciaen=tendencia(b,:);
      for a=1+b:1:7+b-1
         serie=[serie datosentrena(a,:)]; 
         pesosen=[pesosen pesosentrena(a,:)];
 %        tendenciaen=[tendenciaen tendencia(a,:)]
		end
      d=d+1;  serie1(d,:)=serie ;   pesos1(d,:)=pesosen;  
      %tenden(d,:)=tendenciaen;
      c=c+7;
      end
      clear pesosen
      
      
%-----------------------------------------------------------------%
%Determinación de los maximos valores para determinar limites de graf   
% determinación del par de máximos y mínimos
ls=minmax(transpose(serie1));	li=minmax(transpose(serie1));
% determinación del valor máximo y mínimo
ls=max(ls);ls=max(ls);			li=min(li);li=min(li);
% creación de un archivo vacio de tendencia para deshabilitar la interfase
% creada con Delphi
tendencia=0;
dlmwrite('tendencia.txt',tendencia,',');  
clear tendencia
%------------------------------------------------------------------%
media=mean((serie1),1);
   % determinación del ciclo y salvado del ciclo
  ciclo=media; 
  disp('espere unos instantes')
  dlmwrite('ciclo.txt',ciclo,',');  
%-------------------------------------------------------------------%
%Recuperación de la tendencia
%-------------------------------------------------------------------- 
tamano=size(serie1);
seriecompleta=[];
% estructuración de la serie de datos
for a=1:1:tamano(1)
   seriecompleta=[seriecompleta serie1(a,:)];  % datos de demanda como series de tiempo
 %  pesosdefent=[pesosdefent pesos1(a,:)];
end
tamano=size(serie1);
ciclodef=[];
disp('se inicio la deteccion de la irregularidad')
ciclo1=ciclo;
for a=1:1:tamano(1)
   ciclodef=[ciclodef ciclo1]; %repetición del ciclo para formar serie de tiempo
end
seriec=seriecompleta;
seriecompleta=seriecompleta./ciclodef;
% toma de datos del tiempo 
tamano=size(seriecompleta);
horas=1;
for hor=2:1:tamano(2)
      horas=[horas hor];
   end
   clc
% disp('si observa una figura sin botones de control utilice el tabulador y alt para ver los procesos')
 %disp('activos seleccione con ellos la figura de matlab y continue con la simulación')
 % interface determinadora del tipo de tendencia a usar
 %tipotend=questdlg('A que comportamiento desea ajustar la tendencia?', ...
  %                      'ajuste tendencia', ...
  %                      'Lineal','Cuadratica','Logaritmica','Logaritmica');
 %switch tipotend
 %  case 'Lineal'
   [coef,s1]=polyfit(horas,seriecompleta,1); % ajuste a una recta
   tendencialin=polyval(coef,horas);   
  %  case 'Cuadratica'
   [coef,s2]=polyfit(horas,seriecompleta,2); % ajuste a curva
   tendenciac=polyval(coef,horas);
   %case 'Logaritmica'
      datosalog=[];   
   datosalog1=log10(seriecompleta); % determinación de los log de los datos
   horasalog=log10(horas); 
   [coef,s3]=polyfit(horasalog,datosalog1,1); % ajuste a recta
   tendencia=polyval(coef,horasalog);
   tendencialog=exp(tendencia);
   % determinacion de coeficientes de correlación
   % -------------------------------------------------------------
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
c=1;d=0;
tate=size(tendencia);
for b=1:168:tate(2)
  tendenciaen=tendencia(1,b:168+b-1);
  c=c+1;  b;
tenden(c,:)=tendenciaen;
end
tenden(1,:)=[];
%------------------------------------------------------------------%
clear ci1 ci cicloa1
ciclo;
%------------------------------------------------------------------%
%-----------------------------------------------------------------%
% Determinación de la irregularidad de los datos

   ct=tendencia;
	tamano=size(serie1);
   irregularidad=seriecompleta./ct;
%------------------------------------------------------------------
%------------------------------------------------------------------
%               TRATAMIENTO DE LOS DATOS DE VALIDACIÓN
%-----------------------------------------------------------------%
%     Determinación de los datos de validación por semanas
	tamano=size(tci1);
	disp('inicio analisis (datos objetivo)')
	tamvec=tamano(1)-procentajeentrena;   d=0;
   clear pesos serie serie2
	serie2=ones((floor(tamano(1)-procentajeentrena)/7),168);
	   for b=procentajeentrena:7:tamano(1)-7
       serie=tci1(b,:);      pesos=pesosobj(1,:);
         e=2;
         for a=2+b:1:7+b
             serie=[serie tci1(a,:)];
             pesos=[pesos pesosobj(e,:)];
             
             e=e+1;
			 end
          d=d+1;   
          serie2(d,:)=serie; 
          pesos2(d,:)=pesos;  
          c=c+7;
      end
% deerminación de la serie organizada por semanas
datosvalida=(serie2);
% determinación del ciclo
 ciclo1=mean(serie2,1);
%--------------------------------------------------------------%
%Recuperación de la tendencia
tamano=size(serie2);
seriecompleta1=[];
%pesosdefobj=[];
for a=1:1:tamano(1)
   seriecompleta1=[seriecompleta1 serie2(a,:)];
 %  pesosdefobj=[pesosdefobj pesos2(a,:)];
end

seriec1=seriecompleta1;
ciclodef1=[];
for a=1:1:tamano(1)
   ciclodef1=[ciclodef1 ciclo1];
end
seriecompleta1=seriecompleta1./ciclodef1;
tamano=size(seriecompleta1);
%tendencia=zeros(tamano(1),tamano(2));
horas1=1;
for hor=2:1:tamano(2)
      horas1=[horas1 hor];
end
clear coef1 s tendencia1

tendencia1=zeros(tamano(1),tamano(2));
% ajuste a la tendencia previamente seleccionada
 switch tipotend
    case 'Lineal'
       [coef1,s]=polyfit(horas1,seriecompleta1,1);
       tendencia1=polyval(coef1,horas1);
    case 'Cuadratica'
        [coef1,s]=polyfit(horas1,seriecompleta1,2);
        tendencia1=polyval(coef1,horas1);
     case 'Logaritmica'
     datosalog1=[];      datosalog1=log10(seriecompleta1);
     horasalog1=log10(horas1);[coef1,s]=polyfit(horasalog1,datosalog1,1);
     tendencia1=polyval(coef1,horasalog1);
     tendencia1=exp(tendencia1);
    end
    tendencia1;
c=1;d=0;
tate=size(tendencia1);
for b=1:168:tate(2)
  tendenciaval=tendencia1(1,b:168+b-1);
  c=c+1;  b;
tendv(c,:)=tendenciaval;
end
tendv(1,:)=[];
    %------------------------------------------------------------------%
ciclo1;
clear cicloa2 civ ci1v
%------------------------------------------------------------------%   
tamano=size(serie2);
disp('se inicio la deteccion de la irregularidad (datos objetivo)')

ct1=tendencia1;
% determinación de la irregularidad en datos objetivo
irregularidad1=seriecompleta1./ct1;
disp('se termino el procesamiento')
Botonexp=questdlg('Desea suavizar los datos exponencialmente?', ...
                         'Suavizado exponencial', ...
                         'Si','No','Si');
switch Botonexp,
  case 'Si'    		% suavizado exponencial
   tamano=size(seriecompleta); pr2=[];
   alfa=50/(tamano(2)+1);      
   % determinación de la cte alfa modificacion criterio de brown
   %  cambiado de 2 a 50 
   pr2(1,1)=irregularidad(1,1);
    for i=2:1:tamano(2)
      pr2(1,i)=alfa*irregularidad(1,i)+(1-alfa)*pr2(1,i-1);
    end
disp('se suavizo exponencialmente la componente irregularidad (datos entrenamiento)')
     tamano=size(seriecompleta1);
	  pr3(1,:)=irregularidad1(1,:);
	 for i=2:1:tamano(2)
	  pr3(1,i)=alfa.*irregularidad1(1,i)+(1-alfa).*pr3(1,i-1);
	 end
disp('se suavizo exponencialmente la componente irregularidad (datos de validación)')

case 'No',
    pr2=irregularidad;
    pr3=irregularidad1;
    disp('las componentes de irregularidad se dejaron tal cual')
 end 
 pra=(pr2);
 disp('Se descompuso la serie')
%----------------------------------------------------------------------
%Recuperación de los datos de entrenamiento   
%recuperacion=questdlg('Desea observar la recuperación de la señal', ...
 %                       'Recuperación', ...
  %                      'Si','No','No');
%----------------------------------------------------------------%
% Generación de los archivos
tam=size(pesos1); re=size(pr2); a=1; b=tam(2); i=1;
pr21=zeros(re(2)/tam(2),tam(2));
while b<=re(2) 
 pr21(i,:)=pr2(1,a:1:b);
 i=i+1; a=a+tam(2); b=b+tam(2);
end
 	pra=minmax(pr21);
	dlmwrite('tendencia.txt',tendencia,',');
	dlmwrite('ciclo.txt',ciclo,',');
   dlmwrite('irrtot.txt',pr21,',');
   dlmwrite('pesosent.txt',pesos1,',')
	dlmwrite('mmaxirent.txt',pra,',');
%-----------------------------------------------------------------%
  prb=(pr3);
%----------------------------------------------------------------% 
%Generación de los archivos 
tam=size(pesos2);
re=size(pr3);
a=1; b=tam(2); i=1;
pr31=zeros(re(2)/tam(2),tam(2));
while b<=re(2) 
   pr31(i,:)=pr3(1,a:1:b);
i=i+1; a=a+tam(2); b=b+tam(2);
end
 	prb=minmax(pr31);
     dlmwrite('irregula1.txt',pr31,',');
   dlmwrite('pesosobj.txt',pesos2,',')
   dlmwrite('mmaxirobj.txt',prb,',');
   prb=(pr3);
%--------------------------------------------------------------%
creaserie241
% ------------------------------------------------------------------


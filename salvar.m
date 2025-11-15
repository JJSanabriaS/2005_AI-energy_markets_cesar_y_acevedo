clear h0 h1 h2 ha hb1 hfc* htc* tc1 tc2 tc3 tc4 tc5 tc6 tc7 tc8 

answer=inputdlg('para salvar escriba el nombre de la red y presione ok','comando a introducir');
answer1=strcat(answer,'.mat');
fid=fopen('redessalvadas.txt','w+');
fprintf(fid,char(answer1),'\r');
fprintf(fid,'\t');
fclose(fid);
answer=strcat('save','_',char(answer),'.mat');
answer=strrep(answer,'_',' ');
eval((answer));
fid=fopen('resultpruebagca.csv','w'); fprintf(fid,'Entrenada el ');
fprintf(fid,','); fprintf(fid,'Inicio de datos:');
fprintf(fid,','); fprintf(fid,'fin de datos :');
fprintf(fid,','); fprintf(fid,'Festivos','\r');
fprintf(fid,','); fprintf(fid,'Tendencia:');
fprintf(fid,','); fprintf(fid,'Suavizado:');
fprintf(fid,','); fprintf(fid,'Tipo de red :');
fprintf(fid,','); fprintf(fid,'Función de entrenamiento : ');
fprintf(fid,','); fprintf(fid,'Función de aprendizaje : ');
fprintf(fid,','); fprintf(fid,'Numero de capas:  ');
fprintf(fid,','); fprintf(fid,'tamaño');
fprintf(fid,','); fprintf(fid,'funcion de transferencia',','); 
fprintf(fid,','); fprintf(fid,'Error RNA(con pesos) en entrenamiento:  ');
fprintf(fid,',' );fprintf(fid,'Error medio cuadrado:  ');
fprintf(fid,',' );fprintf(fid,'Cantidad de épocas empleadas: ');
fprintf(fid,','); fprintf(fid,'Error RNA(con pesos) en validación:  ');
fprintf(fid,','); fprintf(fid,'Error medio cuadrado:  ');
fprintf(fid,','); fclose(fid);


fid=fopen('resultpruebagca.doc','a+');
fprintf(fid,'\r' ); fprintf(fid,'\r' );
fprintf(fid,'La red utilizada se salvo en el archivo :  ');
fprintf(fid,answer,'\r');
fprintf(fid,'\r'); fprintf(fid,'Entrenada el ');
fprintf(fid,datestr(now),'\r'); fprintf(fid,'\r');
fprintf(fid,'Los datos utilizados en la red corresponden al periodo comprendido entre :');
fprintf(fid,' '); fprintf(fid,num2str(inicio) ); fprintf(fid,' ');
fprintf(fid,'-','\t' ); fprintf(fid,' ');
fprintf(fid,num2str(fechasfin) ,'\r' );
fprintf(fid,'\r' ); fprintf(fid,'\r' );
if inclfestivo==0
   fprintf(fid,'Incluyéndose la información relacionada con festivos','\r');
else
   fprintf(fid,'No se incluye la información relacionada con festivos ','\r');
end
fprintf(fid,'\r' ); fprintf(fid,'\r' );
fprintf(fid,'Durante el proceso se realizaron los siguientes ajustes :');
fprintf(fid,'\r' );
fprintf(fid,'La irregularidad obtenida se ajusto a una tendencia:');
fprintf(fid,' '); fprintf(fid,tipotend,'\r'); fprintf(fid,'\r' );
if Botonexp=='Si'
   fprintf(fid,'\r');
fprintf(fid,'Dicha irregularidad fue suavizada exponencialmente');
fprintf(fid,' ','\r');
else
fprintf(fid,' ','\r'); fprintf(fid,'Dicha irregularidad no fue suavizada');
fprintf(fid,' ','\r');
end   
fprintf(fid,'\r' ); fprintf(fid,'\r' );
fprintf(fid,'Los parámetros de entrenamiento de la red fueron:');
fprintf(fid,' '); fprintf(fid,'\r' ); fprintf(fid,'\r' );
fprintf(fid,'Tipo de red :'); fprintf(fid,tipored ,'\r' );
fprintf(fid,'\r' ); fprintf(fid,'Función de entrenamiento : ');
fprintf(fid,fentrena); fprintf(fid,'\r' );
fprintf(fid,'Función de aprendizaje : '); 
fprintf(fid,faprendiza,'\r'); fprintf(fid,'\r' );
fprintf(fid,'Número de capas:  '); fprintf(fid,num2str(nc),'\r');
fprintf(fid,'\r' ); 
fprintf(fid,'capa      tamaño  función de transferencia','\t'); 
fprintf(fid,'\r' );
for i=1:1:nc
fprintf(fid,' ','\t');   fprintf(fid,strcat('  ',num2str(i)),'\t');
fprintf(fid,'          ','\t');
fprintf(fid,strcat('            ',num2str(tamanocapa(i))),'\t');
fprintf(fid,'            ','\t');
fprintf(fid,strcat('            ',red.layers{i}.transferFcn),'\t');
fprintf(fid,'       ','\t');    fprintf(fid,'\r' );
end
fprintf(fid,'\t'); fprintf(fid,'\r');
fprintf(fid,'Error de la red neuronal (con pesos) durante entrenamiento:  ');
fprintf(fid,num2str(mad),'\r'); fprintf(fid,'\r' );
fprintf(fid,'Error medio cuadrado de la red neuronal:  ');
fprintf(fid,num2str(emc),'\r'); fprintf(fid,'\r' );
tam=size(epoca);
fprintf(fid,'Cantidad de épocas empleadas: ');tam=size(epoca);
fprintf(fid,num2str(epoca(tam(2))),'\r'); fprintf(fid,'\r');
fprintf(fid,'Error de la red neuronal (con pesos) durante validación:  ');
fprintf(fid,num2str(mad1),'\r'); fprintf(fid,'\r' );
fprintf(fid,'Error medio cuadrado de la red neuronal:  ');
fprintf(fid,num2str(emc1),'\r'); fprintf(fid,'\r' );
fprintf(fid,'\r'); fprintf(fid,'\r');

fprintf(fid,'\r'); fclose(fid); clear fid

fid=fopen('resultpruebagca.csv','a+');
fprintf(fid,'\r'); fprintf(fid,datestr(now));
fprintf(fid,',');  fprintf(fid,num2str(inicio));
fprintf(fid,',');  fprintf(fid,num2str(fechasfin));
fprintf(fid,',' ); 
if inclfestivo==0
   fprintf(fid,'Si','\r');
else
   fprintf(fid,'No ','\r');
end
fprintf(fid,',' ); fprintf(fid,tipotend); fprintf(fid,',' );
if Botonexp=='Si'
fprintf(fid,'Exponencial');
else
fprintf(fid,','); fprintf(fid,'No'); fprintf(fid,',');
end   
fprintf(fid,','); fprintf(fid,tipored ,',' ); fprintf(fid,',' );
fprintf(fid,fentrena); fprintf(fid,','); fprintf(fid,faprendiza,',');
fprintf(fid,','); fprintf(fid,num2str(nc),',');
fprintf(fid,','); fprintf(fid,strcat(num2str(tamanocapa(1,1))),',');
fprintf(fid,','); fprintf(fid,strcat('tansig',','));
fprintf(fid,num2str(mad),',');
fprintf(fid,',' ); fprintf(fid,num2str(emc),',');
tam=size(epoca);   fprintf(fid,',' );
fprintf(fid,num2str(epoca(tam(2))),','); fprintf(fid,',' );
%tam=size(epoca);   fprintf(fid,num2str(epoca(tam(2))));
%fprintf(fid,',');  
fprintf(fid,num2str(mad1),',');
fprintf(fid,',' ); fprintf(fid,num2str(emc1),',');
fprintf(fid,',' ); 
%tam=size(epoca1);  fprintf(fid,num2str(epoca1(tam(2))));
%fprintf(fid,',');  
fclose(fid);
% --------------------------------------------------------------------
%clear a alfa ans b c d d1 emc1 errormedio1 fc1 fc2 fc3 fc4 fc5 fc6 fc7 fc8 
%clear nsal p htc1 htc2 htc3 htc4 htc5 htc6 htc7 htc8 i lar largo li linf linf1 h1
%clear h2 h3 h4 h5 h6 h7 h8 hc he hfc1 hfc2 hfc3 hfc4 hfc5 hfc6 hfc7 hfc8 hor hr 
%clear v var vect salir t tan tamano tamvec tc1 tc2 tc3 tc4 tc5 tc6 tc7 tc8 


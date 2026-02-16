fid=fopen('resultpruebagca.doc','a+');
fprintf(fid,'\r' );
fprintf(fid,'\r' );
%fprintf(fid,'La red utilizada se salvo en el archivo :  ');
%fprintf(fid,answer,'\r');
fprintf(fid,'\r');
fprintf(fid,'Entrenada el ');
fprintf(fid,datestr(now),'\r');
fprintf(fid,'\r');
fprintf(fid,'Los datos utilizados en la red corresponden al periodo comprendido entre :');
fprintf(fid,' ');
fprintf(fid,num2str(inicio));
fprintf(fid,' ');
fprintf(fid,'-','\t' );
fprintf(fid,' ');
fprintf(fid,num2str(fechasfin) ,'\r' );
fprintf(fid,'\r' );
fprintf(fid,'\r' );
if inclfestivo==0
   fprintf(fid,'Incluyéndose la información relacionada con festivos','\r');
else
   fprintf(fid,'No se incluye la información relacionada con festivos ','\r');
end
fprintf(fid,'\r' );
fprintf(fid,'\r' );
fprintf(fid,'Durante el proceso se realizaron los siguientes ajustes :');
fprintf(fid,'\r' );
fprintf(fid,'La irregularidad obtenida se ajusto a una tendencia:');
fprintf(fid,' ');
fprintf(fid,tipotend,'\r');
fprintf(fid,'\r' );
if Botonexp=='Si'
   fprintf(fid,'\r');
fprintf(fid,'Dicha irregularidad fue suavizada exponencialmente');
fprintf(fid,' ','\r');
else
fprintf(fid,' ','\r');
fprintf(fid,'Dicha irregularidad no fue suavizada');
fprintf(fid,' ','\r');
end   
fprintf(fid,'\r' );
fprintf(fid,'\r' );
fprintf(fid,'Los parámetros de entrenamiento de la red fueron:');
fprintf(fid,' ');
fprintf(fid,'\r' );
fprintf(fid,'\r' );
fprintf(fid,'Tipo de red :');
fprintf(fid,tipored ,'\r' );
fprintf(fid,'\r' );
fprintf(fid,'Función de entrenamiento : ');
fprintf(fid,fentrena);
fprintf(fid,'\r' );
fprintf(fid,'Función de aprendizaje : ');
fprintf(fid,faprendiza,'\r');
fprintf(fid,'\r' );
fprintf(fid,'Número de capas activas:  ');
fprintf(fid,num2str(nc),'\r');
fprintf(fid,'\r' );
fprintf(fid,'tamcapa1 tamcapa2 tamcapa3 tamcapa4 tamcapa5   func transferencia','\t'); 
fprintf(fid,'\r' );
fprintf(fid,' ','\t');
%   fprintf(fid,strcat('  ',num2str(j)),'\t');
%   fprintf(fid,'          ','\t');
   fprintf(fid,strcat('              ',num2str(tc1)),'\t');
   fprintf(fid,'           ','\t');
   fprintf(fid,strcat('     ',num2str(tc2)),'\t');
   fprintf(fid,'        ','\t');
   fprintf(fid,strcat('     ',num2str(tc3)),'\t');
   fprintf(fid,'         ','\t');
   fprintf(fid,strcat('     ',num2str(tc4)),'\t');
   fprintf(fid,'    ','\t');
   fprintf(fid,strcat('     ',num2str(tc5)),'\t');
   fprintf(fid,'           ','\t');
   fprintf(fid,strcat('     ',red.layers{i}.transferFcn),'\t');
   fprintf(fid,' ','\t');
   fprintf(fid,'\r' );
fprintf(fid,'\t');
fprintf(fid,'\r');
fprintf(fid,'MAD durante entrenamiento : ');
fprintf(fid,num2str(mad),'\r');
fprintf(fid,'\r' );
fprintf(fid,'MSE :  ');
fprintf(fid,num2str(emc),'\r');
fprintf(fid,'\r' );
fprintf(fid,'MAPE :  ');
fprintf(fid,num2str(mape),'\r');
fprintf(fid,'\r' );
tam=size(epoca);
fprintf(fid,'Cantidad de épocas empleadas: ');tam=size(epoca);
fprintf(fid,num2str(epoca(tam(2))),'\r');
fprintf(fid,'\r');
fprintf(fid,'MAD durante validación : ');
fprintf(fid,num2str(mad1),'\r');
fprintf(fid,'\r' );
fprintf(fid,'MSE :  ');
fprintf(fid,num2str(emc1),'\r');
fprintf(fid,'\r' );
fprintf(fid,'MAPE :  ');
fprintf(fid,num2str(mape1),'\r');
fprintf(fid,'\r' );
fprintf(fid,'\r' );
fprintf(fid,'\r');
fprintf(fid,'\r');
fclose(fid);
clear fid
fid=fopen('resultpruebagca.csv','a+');
fprintf(fid,'\r');
fprintf(fid,datestr(now));
fprintf(fid,',');
fprintf(fid,num2str(inicio ));
fprintf(fid,',');
fprintf(fid,num2str(fechasfin));
fprintf(fid,',' );
if inclfestivo==0
   fprintf(fid,'Si','\r');
else
   fprintf(fid,'No ','\r');
end
fprintf(fid,',' );
fprintf(fid,tipotend);
fprintf(fid,',' );
if Botonexp=='Si'
fprintf(fid,'Exponencial');
else
fprintf(fid,'No');
end  
fprintf(fid,',');
fprintf(fid,tipored);
fprintf(fid,',' );
fprintf(fid,fentrena);
fprintf(fid,',');
fprintf(fid,faprendiza,',');
fprintf(fid,',');
fprintf(fid,num2str(nc),',');
fprintf(fid,',');
fprintf(fid,num2str(tc1));
fprintf(fid,',');
fprintf(fid,num2str(tc2));
fprintf(fid,',');
fprintf(fid,num2str(tc3));
fprintf(fid,',');
fprintf(fid,num2str(tc4));
fprintf(fid,',');
fprintf(fid,num2str(tc5));
fprintf(fid,',');
fprintf(fid,strcat(red.layers{i}.transferFcn,','));
fprintf(fid,num2str(mad),',');
fprintf(fid,',' );
fprintf(fid,num2str(emc),',');
fprintf(fid,',' );
fprintf(fid,num2str(mape),',');
tam=size(epoca);
fprintf(fid,',' );
fprintf(fid,num2str(epoca(tam(2))),',');
fprintf(fid,',' );
tam=size(epoca);
%fprintf(fid,num2str(epoca(tam(2))));
%fprintf(fid,',');
fprintf(fid,num2str(mad1),',');
fprintf(fid,',' );
fprintf(fid,num2str(emc1),',');
fprintf(fid,',' );
fprintf(fid,num2str(mape1),',');
fprintf(fid,',' );
tam=size(epoca);
fprintf(fid,num2str(epoca(tam(2))));
fprintf(fid,',');
%tam=size(epoca1);
%fprintf(fid,num2str(epoca1(tam(2))));
%fprintf(fid,',');
fclose(fid);

% --------------------------------------------------------------------
%clear a alfa ans b c d d1 emc1 errormedio1 fc1 fc2 fc3 fc4 fc5 fc6 fc7 fc8 
%clear nsal p htc1 htc2 htc3 htc4 htc5 htc6 htc7 htc8 i lar largo li linf linf1 h1
%clear h2 h3 h4 h5 h6 h7 h8 hc he hfc1 hfc2 hfc3 hfc4 hfc5 hfc6 hfc7 hfc8 hor hr 
%clear v var vect salir t tan tamano tamvec tc1 tc2 tc3 tc4 tc5 tc6 tc7 tc8 

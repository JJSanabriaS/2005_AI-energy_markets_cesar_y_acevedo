
 %-------------------------------------------------------------------
  %  Grafica de la irregularidad de los datos de validación
	figure
	set(gcf,'name','irregularidad de los datos de validación');
   set(gcf,'menubar','none');
   set(gcf,'color',[1 1 1]);
   set(gcf,'position',[85 80.75 650 420])
	subplot(2,1,1);
   plot((irregularidad1));  	title('irregularidad');grid;xlabel('Horas');
   
   % etiquetas de días
   
    
    switch Botonexp
   case 'Si'
     %etiquetas con los días correspondientes
    subplot(2,1,2);
   plot((prb));						grid;
   xlabel('Horas');
    title('irregularidad suavizada exponencialmente');grid;
   
	case 'No'  
   title('irregularidad ');grid;
   %etiquetas con los días correspondientes
   
end
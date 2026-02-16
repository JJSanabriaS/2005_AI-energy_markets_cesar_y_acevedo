% grafica de la tendencia y ciclo de los datos de validación
	figure
	set(gcf,'name','tendencia de los datos de objetivo');
   set(gcf,'menubar','none');
   set(gcf,'color',[1 1 1]);
   set(gcf,'position',[85 80.75 650 420])
tamano=size(seriecompleta1);
larg=tamano(2);
   ls=minmax((tendencia1));
   li=minmax((tendencia1));ls=max(ls);			li=min(li);
   plot((tendencia1));axis([0 larg li(1) ls(1)]);
   title('Tendencia');grid;
   xlabel('Horas');
      switch tipotend
   case 'Lineal'
    case 'Cuadratica'
    case 'Logaritmica'

     end
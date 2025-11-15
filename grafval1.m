  % Graficas por semanas y su perfil medio  (datos objetivo)
   tamano=size(serie2);     largo=tamano(2);       ls=minmax(ciclodef1);
   li=minmax(ciclodef1);ls=max(ls);			li=min(li);
   figure;   subplot(2,1,1);
   plot(transpose(datosvalida));
   axis([0 largo li ls]);
   ylabel(ulabel);                      xlabel('Hora de la semana');
	title('datos de validacion');grid;
   subplot(2,1,2);plot(ciclo1);   ylabel(ulabel);
   xlabel('Hora de la semana');
   axis([0 largo li ls]);
	title('ciclo');grid;
	set(gcf,'name','datos de validacion');
   set(gcf,'menubar','none');
   set(gcf,'color',[1 1 1]);
   set(gcf,'position',[85 80.75 650 420])
   text(14.5,li+10,vect(1,:));  text(34.5,li+10,vect(2,:));
   text(64.5,li+10,vect(3,:));  text(84.5,li+10,vect(4,:));
   text(104.5,li+10,vect(5,:)); text(130.5,li+10,vect(6,:));
   text(154.5,li+10,vect(7,:));
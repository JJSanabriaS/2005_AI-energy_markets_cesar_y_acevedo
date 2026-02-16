  figure 
  set(gcf,'name','Recuperación de la serie');
  set(gcf,'menubar','none');
  set(gcf,'color',[1 1 1]);
  set(gcf,'position',[85 80.75 650 420])
  recuperacio=pr2.*ciclodef.*tendencia;
  subplot(3,1,1);
  larg=size(recuperacio);
  ls=minmax((recuperacio));           li=minmax((recuperacio));  
  ls=max(ls);							     li=min(li);
  ls=max(ls); %limites nax 
  li=min(li); % limites min de la irreg
  plot(recuperacio,'r');axis([0 larg(2) li ls]);ylabel(ulabel);
  title('serie obtenida de la recomposicion')
  subplot(3,1,2)
  ls=minmax((seriec));        li=minmax((seriec));  
  ls=max(ls);							    li=min(li);
  ls=max(ls); %limites nax 
  li=min(li);
  plot(seriec);axis([0 larg(2) li ls]);ylabel(ulabel);
  title('serie original');
  subplot(3,1,3)
  plot(recuperacio,'r');              hold
  plot(seriec);axis([0 larg(2) li ls]);ylabel(ulabel);
  title('superposición');xlabel('Horas')
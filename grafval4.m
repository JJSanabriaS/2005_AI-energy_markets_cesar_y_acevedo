figure 
set(gcf,'name','Recuperación de la serie de validación');
set(gcf,'menubar','none');
set(gcf,'color',[1 1 1]);
set(gcf,'position',[85 80.75 650 420])
prueba=pr3.*ciclodef1.*tendencia1;
subplot(3,1,1)
plot(seriec1,'r');grid;ylabel(ulabel);
title('serie obtenida de la recomposicion')
subplot(3,1,2)
plot(prueba);grid;ylabel(ulabel);
title('serie original')
subplot(3,1,3)
plot(prueba,'r')
hold
plot(seriec1);grid;ylabel(ulabel);
title('Superposición')
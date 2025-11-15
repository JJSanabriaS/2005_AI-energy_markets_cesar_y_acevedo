% Busqueda de archivos relacionados con anteriores redes 
% y posterior borrado de ellos
a=1;
dlmwrite('estructura.txt',a,'\t')
clear a;
fid=fopen('ciclo.txt'); % busqueda del archivo ciclo asignación a var
if fid~=-1
   fclose(fid);
   delete('ciclo.txt'); % borrado
end
clear fid;

fid=fopen('fechas.txt'); % busqueda
if fid~=-1
   fclose(fid);
delete('fechas.txt');    % borrado
end
clear fid;

fid=fopen('actual.mat'); % busqueda
if fid~=-1
   fclose(fid);
delete('actual.mat');    % borrado
end
clear fid;

fid=fopen('irreg.txt');  % busqueda
if fid~=-1
   fclose(fid);
   delete('irreg.txt');  % borrado
end
clear fid;

fid=fopen('irreg1.txt'); % busqueda
if fid~=-1
   fclose(fid);
   delete('irreg1.txt'); % borrado 
end
clear fid;

fid=fopen('irregula1.txt'); % busqueda
if fid~=-1
   fclose(fid);
   delete('irregula1.txt'); % borrado
end
clear fid;

fid=fopen('irrtot.txt'); % busqueda
if fid~=-1
   fclose(fid);
	delete('irrtot.txt');  % borrado
end
clear fid;

fid=fopen('resultados.txt'); % busqueda
if fid~=-1
   fclose(fid);
   delete('resultados.txt'); % borrado
end
clear fid;

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

fid=fopen('resultentrena.doc'); % busqueda
if fid~=-1
   fclose(fid);
   delete('resultentrena.doc'); % borrado
end

fid=fopen('resultpruebagca.doc'); % busqueda
if fid~=-1
   fclose(fid);
delete('resultpruebagca.doc');   % borrado
end

fid=fopen('resultpruebagca.csv'); % busqueda
if fid~=-1
   fclose(fid);
delete('resultpruebagca.csv');    % borrado
end

clc
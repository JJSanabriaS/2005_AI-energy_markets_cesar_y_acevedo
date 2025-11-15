<HTML><HEAD><TITLE>Untitled Document</TITLE><LINK 
href="rna_ar/estilo.css" type=text/css rel=STYLESHEET>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<META content="MSHTML 6.00.2600.0" name=GENERATOR></HEAD>
<BODY bgColor=#ffffff>
<TABLE width="100%" border=0>
  <TBODY>
  <TR>
    <TD></A></TD>
    <TD></A></TD>
    <TD></A></TD>
    <TD></A></TD>
    <TD></A></TD></TR></TBODY></TABLE>
<DIV align=center>
<P class=centerazul>URL http://gpds.uv.es/gpds/nn</P></DIV>
<P class=texto><FONT color=#003366 size=4><B>REDES NEURONALES 
ARTIFICIALES.</B></FONT></P>
<P class=texto><BR></P>
<TABLE width="100%" border=0>
  <TBODY>
  <TR>
    <TD class=textoblanco bgColor=#6699cc height=25>I. 
  INTRODUCCIÓN.</TD></TR></TBODY></TABLE>
<P class=texto>El uso de las redes neuronales artificiales en diferentes campos 
del conocimiento (control, procesado de la señal, sistemas expertos, predicción 
en series temporales, etc) han sufrido un crecimiento exponencial en los últimos 
años [1],[2],[3]. Este número tan elevado se debe se explica por su aplicación 
en problemas de clasificación, modelización y predicción. <BR>&nbsp; </P>
<P class=texto>Las redes neuronales son preferibles a otros métodos matemáticos 
cuando se presentan las siguientes características:</P>
<OL>
  <LI>
  <P class=texto>Es muy difícil encontrar las reglas que definen la variable a 
  modelizar en relación a las variables independientes consideradas para el 
  modelo.</P>
  <LI>
  <P class=texto>Los datos son imprecisos o contienen perturbaciones 
  estadísticas (ruido).</P>
  <LI>
  <P class=texto>El problema necesita para ser definido un gran número de 
  variables dependientes (presenta una alta dimensionalidad).</P>
  <LI>
  <P class=texto>El modelo a resolver es no lineal.</P>
  <LI>
  <P class=texto>Se dispone de un gran número de datos.</P>
  <LI>
  <P class=texto>El entorno de trabajo es variable. </P></LI></OL>
<P class=texto>Sin embargo, a pesar de suaplicabilidad y su potencia,&nbsp; 
existe un cierto recelo a su uso ya que se consideran "cajas negras"&nbsp; que 
dan buenos resultados por “casualidad”. Esta impresión no es real por cuanto 
que: </P>
<UL>
  <LI>
  <P class=texto>&nbsp;Existen libros de redes neuronales escritos por 
  matemáticos estadísticos de gran prestigio internacional [4],[5].</P>
  <LI>
  <P class=texto>&nbsp;En libros de análisis multivariante clásicos se da como 
  camino a seguir las redes neuronales [6]</P>
  <LI>
  <P class=texto>&nbsp;Programas informáticos usualmente usados en análisis de 
  datos, por ejemplo el famoso y ampliamente extendido SPSS, incluyen módulos de 
  redes neuronales [7].</P>
  <LI>
  <P class=texto>&nbsp;Existen multitud de demostraciones de la convergencia de 
  los valores de salida de un tipo de red neuronal, el perceptrón multicapa, 
  hacia los valores definidos por el Teorema de Bayes; herramienta de uso común 
  en problemas de clasificación [8].</P></LI></UL>
<TABLE width="100%" border=0>
  <TBODY>
  <TR>
    <TD class=textoblanco bgColor=#6699cc height=25>II. DESCRIPCIÓN DE LAS 
      REDES NEURONALES. </TD></TR></TBODY></TABLE>
<P class=textoazul2>II. 1 Arquitectura de las redes </P>
<P class=texto>En teoría de redes neuronales podemos distinguir tres niveles en 
su arquitectura: </P>
<OL>
  <LI>
  <P class=texto>Microestructura. Hace referencia a los elementos más pequeños 
  de las redes neuronales: las neuronas.</P>
  <LI>
  <P class=texto>Mesoestructura. Resultado de la combinación de las neuronas. 
  Serían las redes neuronales propiamente dichas.</P>
  <LI>
  <P class=texto>Macroestructura. Combinación de redes, se podría denominar a 
  este nivel “comité de expertos”. Existen diferentes tipos de combinación : 
  paralelo, jerárquica, etc. dependiendo de la aplicación que se quiera 
  implementar. </P></LI></OL>
<P class=textoazul2>II.1.1 Microestructura. </P>
<P class=texto><BR>Es el elemento básico de la red: la neurona, que puede tener 
diferentes formas dependiendo de la aplicación: </P>
<DIV align=center><IMG height=142 src="rna_ar/Image2.gif" 
width=399><BR>Figura 1. Esquema de una neurona. </DIV>
<P class=texto>En general una neurona tendrá los siguientes elementos: </P>
<UL class=texto>
  <LI>
  <P class=texto>Entradas. Son las datos a utilizar por la neurona. Pueden ser 
  las variables de entrada, si la neurona está en la capa de entrada del 
  sistema, o las salidas de otras neuronas. Si alguna de las entradas a la 
  neurona es una salida de dicha neurona estaríamos hablando de una neurona 
  recurrente o con memoria.</P>
  <LI>Conexiones.&nbsp; Denominados pesos en teoría de redes neuronales. Son los 
  factores multiplicativos de las entradas. Existe un peso adicional denominado 
  umbral que tiene como entrada 1. El significado de este peso es englobar el 
  umbral que aparece en la figura 1. Este umbral define el valor para el cual la 
  neurona se activa, es decir:<BR>
  <DIV align=center><IMG height=51 src="rna_ar/Image3.gif" width=335> 
  </DIV><BR>si tomamos el peso w0 como –umbral entonces la anterior expresión 
  queda como: <BR>
  <DIV align=center><IMG height=51 src="rna_ar/Image4.gif" width=331> 
  </DIV>
  <P class=texto>El proceso de aprendizaje de una red radica en la modificación 
  de estos pesos de acuerdo con un algoritmo determinado. </P>
  <LI>
  <P class=texto>Función de activación. Elemento básico en la neurona. Esta 
  función le da a la neurona su carácter no lineal y, por lo tanto, amplía el 
  campo de aplicación frente a otros métodos clásicos de análisis de datos. 
  Existen muchos tipos de función; algunos de los más usuales son: sigmoide, 
  tangente hiperbólica, función signo, etc.</P>
  <LI>
  <P class=texto>Una función de estado. Define el estado actual de la neurona en 
  función de las entradas actuales, de la salida y del estado anterior. 
  Normalmente esta función es la función identidad.</P></LI></UL>
<P class=texto>&nbsp;Si combinamos la estructura de una neurona con una de las 
funciones de activación más usada, la sigmoide, aparece una relación matemática 
habitualmente utilizada como prueba diagnóstica: la regresión logística. En 
efecto, este método matemático consiste en modelizar la probabilidad de un 
determinado evento de acuerdo a la siguiente expresión:</P>
<DIV align=center><IMG height=58 src="rna_ar/Image6.gif" width=356> </DIV>
<P class=texto>&nbsp;donde x<SUB>n</SUB> son las diferentes variables 
independientes de las que depende nuestro problema. </P>
<P class=texto>&nbsp;Los parámetros a determinar son los parámetros wn que son 
equivalentes a los pesos de una neurona. Así pues, cuando se utiliza el método 
de regresión logística se está usando una red constituida por una sola neurona, 
evidentemente este modelo tan sencillo se puede mejorar. Al estudiar este 
modelo, representado por una neurona, se pueden sacar importantes conclusiones. 
En efecto, el caso más sencillo es clasificar dos grupos (A y B) usando la 
probabilidad definida por el modelo de regresión logística. En este modelo se 
define un umbral de tal forma que si el valor de P(x) es superior a ese umbral 
pertenece a la clase A y si no a la B. Esta condición se transforma en que el 
exponente sea mayor que cierta cantidad, es decir: <BR>
<DIV align=center><IMG height=51 src="rna_ar/Image7.gif" width=376> </DIV>
<P class=texto>&nbsp;Veamos qué significa esto con un caso simple: supongamos 
que nuestro problema sólo depende de dos variables, entonces el caso definido 
anteriormente queda como: </P>
<DIV align=center><IMG height=51 src="rna_ar/Image7.jpg" width=376 
border=0> </DIV>
<P class=texto>&nbsp;La frontera entre las dos clases vendrá definida por los 
ejemplos que cumplen la siguiente condición: </P>&nbsp; 
<DIV align=center><IMG height=24 src="rna_ar/Image9.jpg" 
width=168></DIV><BR>
<P class=texto>&nbsp;La ecuación anterior es la ecuación de una recta. Por 
tanto, el modelo de regresión logística sólo permite clasificar correctamente 
elementos que sean linealmente separables; se trata de un modelo muy limitado. 
Se puede aumentar su potencia mediante transformaciones no lineales de las 
entradas pero se requiere un conocimiento a priori del problema que no siempre 
se tiene. La manera de mejorar este modelo es combinar estos elementos de 
proceso en estructuras más grandes: las redes neuronales, pasamos pues a otro 
nivel: la mesoestructura. <BR></P>
<P class=textoazul2>&nbsp;II.1.2 Mesoestructura. </P>
<P class=texto>&nbsp;La combinación de las neuronas se puede realizar de muchas 
formas diferentes. En esta combinación se habla de capas y dependiendo del 
número de éstas y de la conexión entre ellas tenemos diferentes clasificaciones. 
Éstas quedan expuestas en la siguiente tabla. </P>
<DIV align=center><IMG height=169 src="rna_ar/Image10.gif" width=584> 
</DIV>
<P class=texto><BR>&nbsp;A la hora de definir la arquitectura de una red 
neuronal, normalmente se hace referencia a las tres características. Continuando 
con nuestro ejemplo de clasificación, veamos como mejora nuestro clasificador si 
combinamos varias neuronas. Supongamos que queremos diseñar un clasificador para 
el ejemplo definido por los siguientes valores: </P>
<P class=texto>Ejemplo de sistema clasificador:<BR>
<DIV align=center>
<TABLE width="11%" align=center border=0>
  <TBODY>
  <TR class=textoblanco bgColor=#6699cc>
    <TD width="6%">X1</TD>
    <TD width="7%">X2</TD>
    <TD width="87%">Clase</TD></TR>
  <TR>
    <TD width="6%">0</TD>
    <TD width="7%">0</TD>
    <TD width="87%">A</TD></TR>
  <TR>
    <TD width="6%">0</TD>
    <TD width="7%">1</TD>
    <TD width="87%">B</TD></TR>
  <TR>
    <TD width="6%">1</TD>
    <TD width="7%">0</TD>
    <TD width="87%">B</TD></TR>
  <TR>
    <TD width="6%">1</TD>
    <TD width="7%">1</TD>
    <TD width="87%">A</TD></TR></TBODY></TABLE></DIV>
<P class=texto>&nbsp;Para simplificar, usaremos como función de activación la 
función signo y clasificaremos como A si la salida del sistema es&nbsp; -1 y 
clase B si es 1. Si se representa gráficamente el conjunto de entrada se tiene: 
</P>&nbsp; 
<DIV align=center><IMG height=195 src="rna_ar/Image11.jpg" 
width=350><BR>Esquema de los patrones a clasificar. </DIV>
<P class=texto>Para este ejemplo, la mejor solución de clasificación que podría 
plantear un sistema de regresión logística sería el representado por la línea 
recta de la figura que dista mucho de ser óptimo. Veamos cómo resuelven este 
problema las redes neuronales. Con la función de activación signo, ver tabla 1, 
y las clases así definidas el problema tiene como una posible solución la red 
definida por la siguiente figura (los pesos umbrales tienen como entrada +1): 
</P>
<P class=texto>
<DIV align=center>
<DIV align=center></DIV><IMG height=175 src="rna_ar/Image12.jpg" 
width=260> <BR>Red para resolver el problema planteado.</DIV>
<P class=texto>&nbsp; Así, si por ejemplo x1 y x2 tienen valor 0 la salida del 
sistema debe ser –1. Las salidas para las neuronas A, OA,&nbsp; y B, OB, serán: 
</P>
<DIV align=center><IMG height=48 src="rna_ar/Image13.jpg" width=300> 
</DIV>
<P class=texto>&nbsp;Por otra parte la salida de la neurona C, OC, vendrá 
definida por: </P>
<DIV align=center><IMG height=41 src="rna_ar/Image14.jpg" width=285> 
</DIV>
<P class=texto>que es la salida que se busca. 
<P class=texto>
<P class=texto>&nbsp;Por tanto la combinación de diferentes neuronas, en forma 
de redes, amplia su capacidad de proceso de datos. Sin embargo, en determinadas 
situaciones esto no es suficiente y se necesitan combinar redes entre sí, 
pasando al siguiente nivel denominado macroestructura. </P>
<P class=textoazul2>&nbsp;II.1.3 Macroestructura.</P>
<P class=texto>&nbsp;Existen problemas donde una combinación de redes da un 
mejor comportamiento que usar una sola red. Esta combinación puede ser en 
paralelo (todas tienen el mismo peso), en serie (la salida de una red es la 
entrada a otra mayor), jerárquica (en problemas de clasificación, existen redes 
más expertas que otras), etc. o variaciones de ellas dependiendo de la 
aplicación concreta. Un ejemplo sencillo que ayudará a entender la ventaja de 
combinar redes es el problema de modelizar la función valor absoluto que viene 
definida en la expresión: </P>
<P class=texto>
<DIV align=center><IMG height=48 src="rna_ar/Image15.jpg" width=155> 
</DIV>
<P class=texto>&nbsp;De la definición se aprecia que existen dos zonas 
claramente diferenciadas en el domino de x, los valores negativos y los 
positivos. En ese caso se pueden definir dos redes, especializadas en cada zona 
y combinarlas para definir la función total. Otro ejemplo, ahora en 
clasificación, donde se deduce fácilmente la utilidad de combinar diferentes 
redes, es en aquellos problemas donde los datos se agrupan en determinadas zonas 
del espacio formado por las variables de entrada. Si se especializa cada red, 
para cada zona, se obtendrá un resultado óptimo. <BR>&nbsp;En este apartado si 
bien se ha comprobado la posible utilización de las redes neuronales, existe una 
cuestión todavía no resuelta ¿cómo se determina el valor de los pesos?. Es decir 
cuales son los valores que relacionan las neuronas entre si y por tanto, los que 
definen la estructura y comportamiento de la red neuronal. Para el cálculo de 
los pesos se usaran algoritmos de aprendizaje que se definen en las redes 
neuronales. </P>
<P class=textoazul2>&nbsp;II.2 Algoritmos de aprendizaje.</P>
<P class=texto>&nbsp;Los procedimientos para determinar las conexiones entre 
neuronas reciben el nombre de algoritmos de aprendizaje ya que es en los pesos 
donde reside el “conocimiento” de una red. Su clasificación junto con dos de las 
aplicaciones más frecuentes [1]: </P>&nbsp; 
<P class=texto>
<DIV align=center><IMG height=213 src="rna_ar/Image17.jpg" width=498> 
<BR>Tipos de aprendizaje y posibles aplicaciones. </DIV>
<P class=texto>&nbsp;Una primera gran diferenciación del aprendizaje está en si 
es o no. La diferencia estriba en que el supervisado dispone de información 
sobre la salida objetivo o deseada de la red, hecho que no ocurre en el no 
supervisado. Dentro del supervisado hay otra división que se establece en 
función del valor exacto de la salida deseada, aprendizaje por corrección, y si 
sólo se dispone de información lógica (es o no la señal deseada) estamos en un 
aprendizaje por refuerzo. <BR>&nbsp;La forma de proceder en los algoritmos de 
aprendizaje supervisado es definir una función objetivo o error a minimizar. 
Esta función será siempre una función monótona creciente de la diferencia entre 
la señal deseada - señal que debería dar la red - y la salida proporcionada por 
la red. El problema es, pues, de optimización: búsqueda del mínimo de una 
función y aquí aparecen una serie de procedimientos de búsqueda que, 
generalmente, se dividen en dos grupos: </P>
<UL>
  <LI>
  <P class=texto>Métodos de búsqueda global. Buscan el mínimo global de la 
  función objetivo. Proporcionan los pesos que dan el valor más pequeño de dicha 
  función sobre todo su dominio. Entre estos métodos se pueden destacar los 
  procedimientos de búsqueda basados en algoritmos genéticos.</P>
  <LI>
  <P class=texto>Métodos de búsqueda local. Buscan el mínimo más cercano de la 
  función objetivo en relación al estado inicial de los pesos al comenzar dichos 
  algoritmos.&nbsp; Lógicamente dan unos pesos peores que los métodos anteriores 
  pero son algoritmos mucho más rápidos en la obtención de la solución. Entre 
  estos métodos se encuentran todos los basados en descenso por gradiente, 
  gradiente conjugados, quasi-Newton, etc.</P></LI></UL>
<P class=texto>La&nbsp; forma habitual de entrenar estos sistemas supervisados 
es dividir los ejemplos disponibles en dos conjuntos: entrenamiento y 
generalización, normalmente en una relación 2/3 a 1/3. En el ámbito clínico, 
médico y farmaceútico, se conoce al conjunto de generalización como conjunto de 
validación. Con el primer conjunto de datos se entrena la red, esto es, se 
ajustan las conexiones de la red o pesos, y con el segundo se comprueba su 
capacidad de generalización. En este marco hay que tener en cuenta que una de la 
principales características de las redes neuronales, que las hacen especiales 
frente a otros métodos, es su capacidad de generalización; es decir, ante 
entradas desconocidas son capaces de dar salidas aproximadas a las deseadas. 
</P>
<P class=textoazul2>&nbsp;II.3 El perceptrón multicapa.</P>
<P class=texto>&nbsp;El perceptrón multicapa es la red más usada en la 
actualidad ya que se puede aplicar en problemas de clasificación, modelización, 
predicción en series temporales, control discreto, etc. Es una red multicapa, en 
la mayoría de las aplicaciones no recurrente, y que tiene un aprendizaje 
supervisado por corrección o minimización del error [1]. La primera capa recibe 
el nombre de capa de entrada, la última capa de salida y las intermedias se 
denominan ocultas, la figura 7 muestra la arquitectura de un perceptrón 
multicapa tipo: <BR></P>
<P class=texto>
<DIV align=center><IMG height=180 src="rna_ar/Image18.jpg" 
width=265><BR>Esquema de un perceptrón multicapa. </DIV>
<P class=texto>La función objetivo habitualmente usada es la suma de los errores 
al cuadrado: </P>
<P class=texto>
<DIV align=center><IMG height=47 src="rna_ar/Image19.jpg" width=140> 
</DIV>
<P class=texto>&nbsp;Donde el subíndice ‘p’ hace referencia al patrón o muestra 
de entrenamiento y el superíndice ‘s’ la neurona de salida. Por N se entiende el 
número total de neuronas en la capa de salida y por P el de patrones (Ej. número 
de sujetos a clasificar). <BR>&nbsp;El algoritmo más comúnmente usado es un 
procedimiento de búsqueda local, del tipo de descenso por gradiente, que queda 
resumido en los siguientes pasos: </P>
<P class=texto>
<DIV align=center><IMG height=459 src="rna_ar/Image21.jpg" width=458> 
</DIV>
<P class=texto>&nbsp;Este algoritmo, a pesar de su sencillez ha dado muy buenos 
resultados en muchos tipos de aplicaciones, siendo uno de los máximos 
“culpables” de la expansión de las redes neuronales. </P>
<TABLE width="100%" border=0>
  <TBODY>
  <TR>
    <TD class=textoblanco bgColor=#6699cc height=25>II. 
  CONCLUSIONES.</TD></TR></TBODY></TABLE>
<P class=texto>En este trabajo se exponen brevemente las bases de una disciplina 
que ha sufrido una producción científica en los últimos años. De forma 
sorprendente, estos métodos, ampliamente usados en algunos campos del 
conocimiento, no han sido aplicados en otros por falsos mitos aplicados a estos 
elementos. Se podría acabar con una afirmación que puede impulsar a la 
utilziación de estos métodos: "todos aquellos resultados obtenidos con análisis 
multivariante o regresión logística serán como mínimo igualados por una red 
neuronal". La anterior afirmación se bassa en el hecho que, un análisis 
multivariante es una neurona con función de activación lineal y una regresión 
logística una neurona utilizando como función de activación una sigmoide. </P>
<TABLE width="100%" border=0>
  <TBODY>
  <TR>
    <TD class=textoblanco bgColor=#6699cc 
height=25>REFERENCIAS</TD></TR></TBODY></TABLE>
<P class=texto>[1] Haykin, S. “Neural Networks: a Comprehensive Foundation”. 
Prentice-Hall, 1998. </P>
<P class=texto>[2] Mitchell, T. “Machine Learning”. Mc Graw-Hill, 1997. </P>
<P class=texto>[3] Murray, A.F. “Applications of&nbsp; Neural Networks”. Kluwer 
Academic Publishers, 1995. </P>
<P class=texto>[4] Ripley, B.D. “Pattern Recognition &amp; Neural Networks”. 
Cambridge University Press, 1996. </P>
<P class=texto>[5] Bishop, C.M. “Neural Networks for Patern Recognition”. 
Clarendon Press, 1996. </P>
<P class=texto>[6] Hair, J.F.H., et alt. “Multivariate Data Analysis”. Prentice 
Hall 1998. </P>
<P class=texto>[7] Manual del SPSS. </P>
<P class=texto>[8] Hampshire, J.B.,&nbsp; Pearlmutter, B.A. “Equivalence Proofs 
for Multilayer Perceptron Classifiers and the Bayesian Discriminant Function”. 
Proceedings of the 1990 Conectionist Models summer School, disponible 
en:<BR>&nbsp; </P>
<TABLE width="100%" border=0>
  <TBODY>
  <TR></TR></TBODY>
</TABLE>
</BODY></HTML>

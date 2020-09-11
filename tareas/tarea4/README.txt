Criptoaritmos
1. Para ejecutar el programa, primero debemos colocarnos en la carpeta donde se 
   encuentra el archivo criptoaritmos.pl
   Una vez hecho esto, ejecutamos el siguiente comando
   $ swipl -f criptoaritmos.pl
2. Una vez hecho esto, para poder obtener las soluciones al criptoaritmo,
   debemos realizar lo siguiente:
   Por ejemplo, si queremos obtener las soluciones al criptoaritmo 
   "SEND + MORE = MONEY", lo que debemos hacer es escribir cada una de las 
   cadenas como listas, es decir, [S,E,N,D] [M,O,R,E] [M,O,N,E,Y]; donde a las 
   listas que pertenecen a los dos primeros string se les deberá colocar un 0
   al inicio de la lista (por cómo implementamos las reglas), de forma que 
   quedarían de la forma [0,S,E,N,D] [0,M,O,R,E] [M,O,N,E,Y]. Entonces, para 
   poder obtener todas las posibles soluciones de nuestro criptoaritmo debemos 
   escrbir la siguiente línea
   ?- criptoaritmos([0,S,E,N,D], [0,M,O,R,E], [M,O,N,E,Y]).
   S = 7,
   E = 5,
   N = 3,
   D = 1,
   M = 0,
   O = 8,
   R = 2,
   Y = 6 .

   donde se muestra una de las soluciones al problema (el programa genera 
   más, pero por simplicidad sólo se muestra una).


DuckDuck
1. Para ejecutar el programa, primero debemos colocarnos en la carpeta donde se
   encuentra el archivo patos.hs
   Una vez hecho esto, ingresamos en la terminal los siguientes comandos
   $ ghci
   $ :l patos.hs 
2. Una vez hecho esto, para poder obtener la solución al problema, debemos 
   realizar lo siguiente:
   Por ejemplo, si tenemos el 

Cántaros
1. Para ejecutar el programa, primero debemos colocarnos en la carpeta donde se
   encuentra el archivo cantaros.pl
   Una vez hecho esto, ejecutamos el siguiente comando
   $ swipl -f cantaros.pl
2. Una vez hecho esto, para poder obtener la solución al problema, debemos 
   realizar lo siguiente:
   Por ejemplo, si queremos obtener la solución al problema con dos cántaros de 
   5 y 3 litros, respectivamente, donde queremos obtener 2 litros de agua en el 
   jarrón de 5 litros, entonces debemos escribir la siguiente línea
   ?- cantaros(5,3,[2,0],A).
   A = [e(2, 0), e(2, 3), e(5, 0), e(0, 0)] .

   donde el primer estado es el estado Z que ingresamos, mientras que el 
   resto de la lista es la solución al problema (el programa genera más 
   soluciones, pero por simplicidad sólo se muestra una).
   
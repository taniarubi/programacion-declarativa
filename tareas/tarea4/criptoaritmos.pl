/** 
 * Alumna: Rubí Rojas Tania Michelle.
 * Elegí Prolog porque se me hizo más sencilla la representación 
 * del problema en este lenguaje. Solamente hay que indicar cuáles son las 
 * condiciones que debe cumplir el reemplazo de las letras por dígitos
 * (están en base 10, cada letra representa un único dígito, el primer
 * dígito no es cero), mediante la regla suma, que es la que se encargará 
 * de hacer la magia para este problema.
 */
criptoaritmos(L1, L2, LF) :- suma(L1, L2, LF, 0, 0, [0,1,2,3,4,5,6,7,8,9], _).

suma([], [], [], AC, AC, DG, DG).
suma([DIG1|L1], [DIG2|L2], [DIG3|L3], ACD, AC, LDIGS, LDIGS1) :- 
    suma(L1, L2, L3, ACD, ACI, LDIGS, LDIGS2),  
    sumaDigs(DIG1, DIG2, ACI, DIG3, AC, LDIGS2, LDIGS1).

sumaDigs(DIG1, DIG2, AC1, DIG, AC2, LDIGS2, LDIGS1) :-
    % DIG1 es un dígito disponible, mientras que el resto de dígitos 
    % disponibles están en LDIGS3.
    eliminaDig(DIG1, LDIGS2, LDIGS3), eliminaDig(DIG2, LDIGS3, LDIGS4), 
    eliminaDig(DIG, LDIGS4, LDIGS1), SUM is DIG1 + DIG2 + AC1, 
    DIG is SUM mod 10, AC2 is SUM // 10. % // nos da la parte entera de la div.

eliminaDig(X, XS, XS) :- nonvar(X), !. % nos dice que X ya fue utilizado.
eliminaDig(X, [X|XS], XS).
eliminaDig(X, [Y|XS], [Y|YS]) :- eliminaDig(X, XS, YS).

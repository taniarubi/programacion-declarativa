/** 
 * Alumna: Rubí Rojas Tania Michelle.
 * Elegí Prolog porque se me hizo más sencilla la representación 
 * del problema en este lenguaje. Solamente hay que indicar cuáles
 * son los movimientos permitidos para cada uno de los cántaros,
 * y buscar los posibles estados e(X,Y) que hacen que la regla sea 
 * válida (se logró poner Z litros de agua en alguno de los dos 
 * cántaros iniciales).
 */
cantaros(X, Y, [Z,ZZ|_], A):- camino(X, Y, Z, ZZ, [e(0,0)], A).

camino(X, Y, Z, ZZ, [e(A,B)|XS], [e(A,B)|XS]) :- (A = Z, B = ZZ), !.
camino(X, Y, Z, ZZ, [C|XS], YS):- 
    movimiento(X, Y, C, I), not(member(I, [C|XS])), 
    camino(X, Y, Z, ZZ, [I, C|XS], YS).

movimiento(X, Y, e(0,B), e(X,B)).
movimiento(X, Y, e(A,0), e(A,Y)).
movimiento(X, Y, e(A,B), e(A,0)) :- B > 0.
movimiento(X, B, e(A,B), e(0,B)) :- A > 0.
movimiento(X, Y, e(A,B), e(Z,Y)) :- Z is A - (Y - B), Z >= 0.
movimiento(X, Y, e(A,B), e(Z,0)) :- Z is A + B, Z =< X.
movimiento(X, Y, e(A,B), e(X,Z)) :- Z is B - (X - A), Z >=0.
movimiento(X, Y, e(A,B), e(0,Z)) :- Z is A + B, Z =< Y.

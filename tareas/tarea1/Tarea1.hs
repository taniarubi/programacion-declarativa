module Tarea1 where
import Data.Char

-- STRING --
-- Ejercicio 1.
-- Regresa una lista xs en la cual no hay apariciones de letras mayúsculas.
quitaMayusculas :: [Char] -> [Char]
quitaMayusculas [] = []
quitaMayusculas xs = [x | x <- xs, not (x `elem` ['A'..'Z'])]

-- Ejercicio 2.
{- Regresa una lista xs en la cual no hay apariciones de caracteres diferentes 
   de letras. -}
soloLetras :: [Char] -> [Char]
soloLetras [] = []
soloLetras xs = [x | x <- xs, isLetter x]

-- Ejercicio 3.
-- Nos dice si la lista xs es prefijo de la lista ys. 
prefijo :: [Char] -> [Char] -> Bool
prefijo _ [] = False
prefijo [] _ = True
prefijo (x:xs) (y:ys) = (x == y) && prefijo xs ys

-- MERGE SORT -- 
-- Ejercicio 1.
-- Regresa la lista ordena usando Merge Sort.
mergeSort :: (Ord a) => [a] -> [a]
mergeSort [] = []
mergeSort [x] = [x]
mergeSort xs = mezcla (mergeSort f) (mergeSort s)
  where (f, s) = parte xs

{- Regresa una tupla de listas, donde cada componente de la tupla es la miatd 
   izquierda y la mitad derecha, respectivamente, de la lista original -}
parte :: [a] -> ([a], [a])
parte xs = splitAt (length xs `div` 2) xs 

-- Regresa una lista xs, la cual es la mezcla de las dos listas recibidas.
mezcla :: (Ord a) => [a] -> [a] -> [a]
mezcla xs [] = xs 
mezcla [] ys = ys 
mezcla (x:xs) (y:ys) 
  | x <= y    = x : mezcla xs (y:ys)
  | otherwise = y : mezcla (x:xs) ys

-- Ejercicio 2.
-- Regresa una lista xs, la cual es la mezcla de las dos listas recibidas.
mezclaCon :: (a -> a -> Ordering) -> [a] -> [a] -> [a]
mezclaCon _ xs [] = xs
mezclaCon _ [] ys = ys 
mezclaCon comparador (x:xs) (y:ys) = case comparador x y of
  LT -> x : mezclaCon comparador xs (y:ys)
  _  -> y : mezclaCon comparador (x:xs) ys

-- Regresa una lista ordenada usando Merge Sort.
mergeSortCon :: (a -> a -> Ordering) -> [a] -> [a]
mergeSortCon _ [] = []
mergeSortCon _ [x] = [x]
mergeSortCon comparador xs = 
  mezclaCon comparador (mergeSortCon comparador f) (mergeSortCon comparador s)
    where (f, s) = parte xs

-- COLORACIÓN. --
-- Definimos el tipo de dato Color.
data Color = Rojo | Amarillo | Verde | Azul deriving (Eq, Show)

-- Definimos el tipo de dato Balcanes.
data Balcanes = Albania
           | Bulgaria
           | BosniayHerzagovina
           | Kosovo
           | Macedonia
           | Montenegro
           deriving (Eq, Show)

{- Definimos la relacion "Dos países con adyacentes cuando comparten frontera",
   donde x es adyacente a y si (x, y) elem adyacencias o (y, x) elem adyacencias- -}
type Ady = [(Balcanes, Balcanes)]

adyacencias :: Ady
adyacencias = 
    [(Albania, Montenegro), (Albania, Kosovo), (Albania, Macedonia),
     (Bulgaria, Macedonia), (BosniayHerzagovina, Montenegro), 
     (Kosovo, Macedonia), (Kosovo, Montenegro)]

-- Definimos una coloración con el sinónimo:
type Coloracion = [(Color, Balcanes)]

-- Ejercicio 1.
-- Nos dice si la coloración recibida es buena respecto a la matriz de adyacencias.
esBuena :: Ady -> Coloracion -> Bool
esBuena _ [] = True
esBuena [] _ = True
esBuena (x:xs) ys
  | coloresIguales x ys == False = esBuena xs ys 
  | otherwise                    = False 

-- Nos dice si un ordenado que pertenece a una adyacencia tiene los mismos colores.
coloresIguales :: (Balcanes, Balcanes) -> Coloracion -> Bool
coloresIguales xs ys = (buscaColor (fst xs) ys) == (buscaColor (snd xs) ys)

-- Busca el color del país en la lista de Coloración.
buscaColor :: Balcanes -> Coloracion -> Color
buscaColor pais xs = head [c | (c, p) <- xs, pais == p]

-- Ejercicio 2.
--coloraciones :: Ady -> [Coloracion]
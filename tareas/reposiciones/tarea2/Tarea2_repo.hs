-- Rubí Rojas Tania Michelle.

module Tarea2_repo where

-- Ejercicio 1.
-- Nos dice si todos los elementos de una lista cumplen un predicado. 
todos :: (a -> Bool) -> [a] -> Bool
todos p = and . map p 

-- Nos dice si al menos un elemento de una lista cumple un predicado.
alguno :: (a -> Bool) -> [a] -> Bool
alguno p = or . map p

-- Selecciona los elementos de una lista mientras cumplan el predicado.
toma :: (a -> Bool) -> [a] -> [a]
toma _ [] = []
toma p xs = filter p xs

-- Elimina los elementos de una lista mientras cumplan el predicado.
deja :: (a -> Bool) -> [a] -> [a]
deja _ [] = []
deja p xs = filter (not . p) xs

-- Ejercicio 2.
{- Aplica alternadamente las funciones que recibe como argumentos a los
   elementos de la lista. -}
altMap :: (a -> b) -> (a -> b) -> [a] -> [b]
altMap _ _ [] = []
altMap p1 _ [a] = [p1 a]
altMap p1 p2 (x:xs) = p1 x : p2 (head xs) : altMap p1 p2 (tail xs)

-- Ejercicio 3.
-- Algoritmo de Luhn. Verifica la validez de los números de tarjetas bancarias.
luhn :: [Int] -> Bool
luhn = esDivisible . suma . resta . multiplica

{- Dada una lista de enteros, iniciando de izquierda a derecha, multiplicamos
   por dos un número sí y un número no. -}
multiplica :: [Int] -> [Int]
multiplica xs = altMap (*2) (*1) xs

{- Dada una lista de enteros, si un elemento de la lista es mayor a 9, entonces
   le restamos 9. -}
resta :: [Int] -> [Int]
resta xs = (map (+(-9)) (filter (>9) xs)) ++ (filter (<=9) xs)

-- Suma los elementos de una lista.
suma :: [Int] -> Int
suma xs = foldr (+) 0 xs 

-- Nos dice si un número es divisible entre 10.
esDivisible :: Int -> Bool
esDivisible x = (x `mod` 10) == 0

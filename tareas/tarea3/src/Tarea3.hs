-- Rubí Rojas Tania Michelle.
module Tarea3 where

-- Ejercicio 1 --
concat :: [[a]] -> [a]
concat xs = foldr (++) [] xs

minimum :: (Ord a) => [a] -> a
minimum xs = foldr1 (\x cc -> if x < cc then x else cc) xs

reverse :: [a] -> [a]
reverse xs = foldr (\x cc -> cc ++ [x]) [] xs

filter :: (a -> Bool) -> [a] -> [a]
filter p xs = foldr (\x cc -> if p x then x:cc else cc) [] xs

inits :: [a] -> [[a]]
inits xs = foldr (\x xss -> [] : map (x:) xss) [[]] xs

-- Ejercicio 2 --
foldi :: (a -> a) -> a -> Int -> a
foldi _ q 0 = q
foldi f q i = f (foldi f q (pred i))

-- Función add como instancia de foldi.
add :: Int -> Int -> Int
add x y = foldi (1+) x y 

-- Función mult como instancia de foldi.
mult :: Int -> Int -> Int
mult x y = foldi (x+) 0 y

-- Función expt como instancia de foldi.
expt :: Int -> Int -> Int
expt x y = foldi (x*) 1 y

-- Ejercicio 3 --
{- Recibe un entero n y regresa la suma de los cuadrados de los primeros n
   naturales. -}
sumq :: Int -> Int
sumq n = foldr (\x -> \y -> x*x + y) 0 [1..n]

{- Toma dos listas como parámetros y elimina todos los elementos de la segunda
   lista que aparecían en la primera. -}
remove :: (Eq a) => [a] -> [a] -> [a]
remove xs ys = foldr (\y cc -> if (y `elem` xs) then cc else y:cc) [] ys

-- Elimina los elementos adyacentes duplicados en uns lista. 
remdups :: (Eq a) => [a] -> [a]
remdups xs = foldr (\x cc -> if x == head cc then cc else x:cc) [last xs] xs

-- Produce todas las posibles rotaciones de una lista.
rotate :: [a] -> [[a]]
rotate xs = foldl f [] xs
  where f [] _ = [xs]
        f ys _ = (shift (head ys)) : ys 

-- Calcula la rotación de una lista.
shift :: [a] -> [a]
shift [] = []
shift (x:xs) = 
   (foldl (\acc curr -> acc ++ [curr]) [] xs) ++ [(foldl (\acc _ -> acc) x xs)]

-- Ejercicio 4 --
unmerge :: (Ord a) => [a] -> [([a], [a])]
unmerge xs = [(ys, zs) | ys <- (quitarElemento (sublists xs) []), zs <- (quitarElemento (sublists xs) []), merge ys zs == xs]

sublists :: [a] -> [[a]]
sublists [] = [[]]
sublists (x:xs) = [x:sublist | sublist <- sublists xs] ++ sublists xs

quitarElemento :: (Eq a) => [a] -> a -> [a]
quitarElemento [] _ = []
quitarElemento (x:xs) e 
    | x == e = quitarElemento xs e
    | otherwise = x : (quitarElemento xs e)

merge :: (Ord a) => [a] -> [a] -> [a]
merge xs [] = xs 
merge [] ys = ys 
merge (x:xs) (y:ys) 
  | x <= y    = x : merge xs (y:ys)
  | otherwise = y : merge (x:xs) ys

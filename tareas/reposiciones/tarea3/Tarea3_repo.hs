-- Rubí Rojas Tania Michelle.

module Tarea3_repo where

-- 1. Calcula el factorión de un número.
factorion :: Int -> Int
factorion n = foldr (\x y -> (factorial x) + y) 0 (digitos n)

-- Coloca los dígitos de un número en una lista.
digitos :: Int -> [Int]
digitos 0 = []
digitos n = digitos (n `div` 10) ++ [n `mod` 10]

-- Calculamos el factorial de un número.
factorial :: Int -> Int 
factorial n = foldl (*) 1 [1..n]

{- 2. Dado un número n, regresa el número construido con los dígitos de n en
   órden inverso. -}
iflip :: Int -> Int
iflip = transforma . reversa . digitos 

-- Dada una lista, regresa la lista invertida.
reversa :: [a] -> [a]
reversa xs = foldl (\ys y -> y:ys) [] xs

-- Dada una lista de enteros, la convierte a un sólo entero.
transforma :: [Int] -> Int
transforma xs = foldl (\acc d -> (10 * acc) + d) 0 xs

{- 3. Dada una lista de enteros, regresa una lista de los números binarios 
   asociados a los números originales. -}
binarios :: [Int] -> [Int]
binarios xs = foldr ((:) . bin) [] xs

-- Convierte un número n en su representación binaria como una lista.
convierte :: Int -> [Int]
convierte n 
  | n < 2     = [n]
  | otherwise = convierte (n `div` 2) ++ [n `mod` 2]

-- Convierte un número n en su representación binaria.
bin :: Int -> Int
bin = transforma . convierte

{- 4. Dada una lista de enteros, regresa una lista con aquellos elementos que
   son triangulares. -}
triangulares :: [Int] -> [Int]
triangulares xs = filter' esTriangular xs

-- Redefinimos la función filter. 
filter' :: (a -> Bool) -> [a] -> [a]
filter' p xs = foldl (\acc y -> if p y then acc ++ [y] else acc) [] xs

{- Nos dice si un número es triangular. Para ello, nos apoyamos del siguiente 
   teorema: "Un número n es triangular si y sólo si 8n+1 es un cuadrado 
   perfecto". -}
esTriangular :: Int -> Bool
esTriangular n = esEntero (raiz n)

-- Nos dice si un número es un entero.   
esEntero :: (RealFrac a) => a -> Bool
esEntero n = n == fromInteger (round n)

-- Obtenemos la raíz cuadrada de 8n+1.
raiz :: (Integral a, Floating b) => a -> b 
raiz n = sqrt $ fromIntegral $ ((8 * n) + 1)

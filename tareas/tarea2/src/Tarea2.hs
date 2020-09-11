module Tarea2 where

import Data.Bits(Bits, (.&.))

-- Regresa la potencia de 2 más grande menor a n.
gtrPower2 :: Int -> Int
gtrPower2 0 = 0
gtrPower2 1 = 0
gtrPower2 n = last [i | i <- [0..(n-1)], esPotencia2 i == True]

-- Nos dice si un número es potencia de dos.
esPotencia2 :: (Bits i, Integral i) => i -> Bool
esPotencia2 n 
    | n < 1    = False
    |otherwise = n .&. (n-1) == 0

-- Regresa el mayor número de apariciones consecutivas del mismo elemento.
inarow :: (Eq a) => [a] -> Int 
inarow = maximum . cuenta . agrupa 

-- Agrupa el número de apariciones en una lista.
agrupa :: (Eq a) => [a] -> [[a]]
agrupa [] = []
agrupa (x:xs) = loop [x] x xs
    where 
        loop cc _ [] = [cc]
        loop cc c (y:ys) 
            | y == c    = loop (cc ++ [y]) c ys
            | otherwise = cc : loop [y] y ys

{- Cuenta el número de apariciones de cada una de las listas de una 
   lista de listas. -}
cuenta :: [[a]] -> [Int]
cuenta [] = [0]
cuenta xs = map length xs

{- Dado un entero n, regresa una lista con tuplas de la forma (a, b, c, d) 
   tal que 0 < a,b,c,d ≤ n y a^3 + b^3 = c^3 + d^3. -}
ramanujan :: Int -> [(Int, Int, Int, Int)]
ramanujan n 
    | n < 0      = error "El número n debe ser un entero positivo."
    | otherwise = [(a, b, c, d) | a <- [1..n], b <- [a..n], c <- [a+1..n], 
                                   d <- [c..n], tupla a b c d]
        where tupla a b c d = (a*a*a) + (b*b*b) == (c*c*c) + (d*d*d)

import Data.List.Split

type Generation = [String]

genZero :: String -> Generation
genZero [] = []
genZero xs = splitOn "_" xs

evolution :: Generation -> Generation
evolution [] = []
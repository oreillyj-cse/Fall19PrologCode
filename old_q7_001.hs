
--elem recursively
elem' :: Eq a => a -> [a] -> Bool
elem' _ [] = False
elem' x (y:ys)
    | x==y = True
    | otherwise = elem' x ys

nodups :: Eq a => [a] -> [a]
nodups [] = []
nodups (x:xs) 
    | elem x xs = nodups xs
    | otherwise = x: nodups xs

f x = x+2

--with foldr
nodups' xs = foldr f [] xs
    where
        f x [] = [x]
        f x rest = if (elem x rest) then rest else x: rest

evenSum :: [(Int,Int)] -> [Int]
evenSum xs =  filter even (map (\(x,y) -> x+y) xs)

evenSum' :: [(Int,Int)] -> [Int]
evenSum' xs =  filter even (map (\t ->fst t + snd t ) xs)

evenSum'' ps = [ fst p+ snd p | p<-ps, even (fst p+ snd p) ]

evenSum''' ps = [ x+y | (x,y)<-ps, even (x+y) ]

evenSum'''' ps = foldr f [] ps
    where
        f p rest = if even (fst p+ snd p) then (fst p+ snd p):rest else rest

evenSum''''' ps = foldr f [] ps
        where
            f (x,y) rest = if even (x+y) then (x+y):rest else rest
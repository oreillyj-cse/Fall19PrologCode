
--recursive
allPos :: [Int]->Bool
allPos [] = True
allPos (n:ns) 
    | n > 0 = allPos ns
    | otherwise = False

--map or filter
allPos' :: [Int]->Bool
allPos' xs = and (map (>0) xs)

--foldr 
allPos'' :: [Int]->Bool
allPos'' xs = foldr (\ y ys -> (y>0) && ys ) True xs

--triples
triples :: [a] -> [a]
triples = foldr (\x y -> x:x:x:y) []

triples' :: [a] -> [a]
triples' = foldr (\x y -> [x,x,x]++y) []

triples'' xs = concat $ map (\x -> [x,x,x]) xs

triples''' xs = concat [ [x,x,x] | x<- xs ]

triples'''' xs = [ xs!!( i `div` 3) | i<-[0..(3*length xs -1)] ]

triples''''' xs = [ xs!! i | i<-[0.. length xs -1] , _<-[1,2,3] ]

triples'''''' [] = []
triples'''''' (x:xs) = x:x:x: triples'''''' xs 
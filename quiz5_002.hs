--q1: recursively
countOnes :: [Char]->Int
countOnes [] = 0
countOnes (c:cs) 
    | c == '1' = 1+ countOnes cs
    | otherwise = countOnes cs

    
--pattern matching
countOnes' [] = 0
countOnes' ('0':cs) = countOnes' cs
countOnes' ('1':cs) = 1+countOnes' cs

countOnes'' [] = 0
countOnes'' (c:cs) = f c + countOnes'' cs
    where 
        f c = if (c=='1') then 1 else 0

--q2 map filter
countOnes''' bs = length (filter (=='1') bs)


countOnes'''' bs = length $ filter (=='1') bs

countOnes''''' bs = sum $ map f bs 
    where 
         f c = if (c=='1') then 1 else 0

--q3 foldr
count1s cs = foldr (\x y -> if (x=='1') then 1+ y  else y) 0 cs

--q4
compress :: Eq a => [a] -> [a]
compress = foldr f [] 
        where
            f x [] = [x]
            f x rest = if (x /= head rest) then x:rest else rest 

compress' [] = []
compress' xs = foldr (\ (x1,y1) rest -> if (x1 /= y1) then x1:rest else rest) ([last xs]) (pairs xs)
    where
        pairs xs = zip xs (tail xs) 

--not using
compress'' [] = []
compress'' [x] = [x]
compress'' xs = map fst (filter (\pair -> fst pair /= snd pair) (pairs xs)) ++ [last xs]
    where
        pairs xs = zip xs (tail xs) 
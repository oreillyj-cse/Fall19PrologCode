first2same :: Eq a => [a] -> Bool
first2same xs = head xs == head ( tail xs)

first2same' xs = first == second
    where
        first = head xs
        second = head (tail xs)

first2same'' xs = (xs!!0)==(xs!!1)

first2same''' (a:b:xs) = a == b

nor :: Bool -> Bool -> Bool
nor False False = True
nor _ _ = False

q3 = (('f',"fred"), 2 )


multDivSum x y = x*y / (x+y)

q5 = \ xs -> xs !! 1

q5' = \ xs -> xs !! ((length xs) `div` 2)

q6 = [ n | n<-[3,6..] , n `mod` 5 > 0 , n `mod` 10 /= 6 ]
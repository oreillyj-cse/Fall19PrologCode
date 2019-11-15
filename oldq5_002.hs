
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

fib' 0 = 0
fib' 1 = 1
fib' n = fibh 2 0 1 n


fibh m cm2 cm1 stop
    | m == stop = cm2+cm1
    | otherwise = fibh (m+1) cm1 (cm1+cm2) stop

l1norm :: Num a => [a] -> a
l1norm ns =  sum (map abs ns)

l1norm' :: Num a => [a] -> a
l1norm' ns =  sum $ map abs ns

l1norm'' :: Num a => [a] -> a
l1norm'' =  sum.(map abs)

--q3
l1norm''' xs = foldr (\ y f_tail -> abs y + f_tail ) 0 xs
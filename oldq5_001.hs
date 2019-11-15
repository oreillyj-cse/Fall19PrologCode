fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

fib' 0 = 0
fib' 1 = 1
fib' n = fibh 0 1 2 n

fibh fibnm2 fibnm1 n s 
    | n==s = fibnm2 + fibnm1
    | otherwise = fibh fibnm1 (fibnm2 + fibnm1) (n+1) s 

l1norm:: Num a => [a] -> a
l1norm ns = sum (map abs ns)
 
l1norm'  = sum.(map abs)

--q3 using foldr
l1norm'' ns = foldr (+) 0 (map abs ns)

l1norm''' ns =foldr (\ y z -> abs y + z) 0 ns

l1norm'''' ns =foldr s 0 ns
    where
        s = \ y z -> abs y + z

l1norm''''' = foldr (\ y z -> abs y + z) 0

--q2, $ ex
l1norm'''''' :: Num a => [a] -> a
l1norm'''''' ns =  sum $ map abs ns
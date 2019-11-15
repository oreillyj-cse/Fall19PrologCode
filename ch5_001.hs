

factors :: Int -> [Int]
factors n =
   [x | x <- [1..n], n `mod` x == 0]

prime :: Int -> Bool
prime n = factors n == [1,n]

pyths :: Int -> [(Int,Int,Int)]
pyths n = [ (x,y,z) | x<-[1..n], y<-[1..n], z<-[1..n],  x^2 + y^2 == z^2 ]

perfect :: Int -> Bool
perfect n = n == ( sum  ( (tail.reverse) ( factors n) ))

perfect' n = n == sum fs - last fs
   where fs = factors n

perfects n = [ x | x<-[1..n ] , perfect x]

length' xs = sum [ 1 | _ <-xs]

sp :: Num a => [a] -> [a] -> a
--sp xs ys = sum [ xs !! i * ys !! i | i<-[0..(length xs -1)]] 
sp xs ys = sum [ x*y | (x,y) <- zip xs ys]
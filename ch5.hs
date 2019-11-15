

factors :: Int -> [Int]
factors n =
   [x | x <- [1..n], n `mod` x == 0]

prime :: Int -> Bool
prime n = factors n == [1,n]

pyths :: Int -> [(Int,Int,Int)]
pyths n = [ (a,b,c) | a <-[1..n], b<-[1..n], c<-[1..n], a^2+b^2==c^2 ]

pyths2 :: Int -> [(Int,Int,Int)]
pyths2 n = [ (a,b,c) | a <-[1..n], b<-[1..n], c<-[(max a b) ..n], a^2+b^2==c^2 ]

perfects :: Int -> [Int]
--perfects n = [ x| x<-[1..n], (sum.init.factors) x==x]
perfects n = [ x| x<-[1..n], perfect x]

perfect :: Int -> Bool
perfect n = (sum.init.factors) n  == n

sp :: Num a => [a] -> [a] -> a
sp xs ys = sum [ xs!!i * ys!!i | i <-[0.. length xs -1 ] ]

sp' :: Num a => [a] -> [a] -> a
sp' xs ys = sum [ x'*y' | (x',y')<-zip xs ys]

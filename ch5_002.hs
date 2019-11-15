pyths :: Int -> [(Int,Int,Int)]
pyths n = [ (x,y,z) | x<-[1..n],y<-[1..n],z<-[1..n], x^2+y^2 == z^2]

factors :: Int -> [Int]
factors n =
   [x | x <- [1..n], n `mod` x == 0]

perfects :: Int -> [Int]
perfects n = [x | x<-[2..n], x == sum ( init ( factors x) )]

prime :: Int -> Bool
prime n = factors n == [1,n]

sp :: Num a => [a] -> [a] -> a
sp xs ys = sum [ xs !! i * ys !! i | i<-[0..(length xs -1 )]]

sp' [] [] = 0
sp' (x:xs) (y:ys) = x * y + sp' xs ys

sp'' xs ys = sum [ x*y | (x,y)<- zip xs ys ]

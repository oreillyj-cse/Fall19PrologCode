
and' [] =True
and' (b:bs) = b&& and' bs

concat' [] = []
concat' (l:ls) = l ++ concat' ls

replicate' 0 _ = []
replicate' n x = x : replicate' (n-1) x

(!!) :: [a] -> Int -> a
(!!) (x:_) 0 = x
(!!) (_:xs) n = (Main.!!) xs (n-1)

elem' _ [] = False
elem' e (x:xs) 
    | e ==x = True
    | otherwise  = elem' e xs

merge :: Ord a => [a] -> [a] -> [a]
merge [] [] = []
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys) = if x<=y 
                      then x: merge xs (y:ys) 
                      else y: merge (x:xs) ys

merge_sort :: Ord a => [a] -> [a]
merge_sort [] = []
merge_sort [x] = [x]
merge_sort xs = merge sleft sright
    where
        (left,right) = splitAt (length xs `div` 2 ) xs
        sleft = merge_sort left
        sright = merge_sort right





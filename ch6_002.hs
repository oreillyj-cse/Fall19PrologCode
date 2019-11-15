
and' :: [Bool] -> Bool
and' [] = True
and' (x:xs) = x && and' xs 

concat' [] = []
concat' (x:xs) = x ++ concat' xs

replicate' :: Int -> a -> [a]
replicate' 0 _ = []
replicate' n x = [x] ++ replicate' (n-1) x

replicate'' :: Int -> a -> [a]
replicate'' 0 _ = []
replicate'' n x = x : replicate'' (n-1) x

ind :: [a] -> Int -> a
ind (x:_) 0 = x
ind (_:xs) n = ind xs (n-1) 

elem' :: Eq a => a -> [a] -> Bool
elem' _ [] = False
elem' m (x:xs) 
    | m == x = True
    | otherwise = elem' m xs

merge :: Ord a => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys)
    | x <= y = x : merge xs (y:ys)
    | otherwise = y: merge (x:xs) ys

merge_sort :: Ord a => [a] -> [a]
merge_sort [] = []
merge_sort [x] = [x]
merge_sort xs = merge left right
    where
        half = (length xs `div` 2)
        left = merge_sort (take half xs)
        right = merge_sort (drop half xs)

--q1
nodups :: Eq a => [a] -> [a]
nodups [] = []
nodups (x:xs) 
    | elem x xs = nodups xs
    | otherwise = x: nodups xs


elem' :: Eq a => a -> [a] -> Bool
elem' _ [] = False
elem' a (x:xs) 
    | a == x = True
    | otherwise = elem' a xs
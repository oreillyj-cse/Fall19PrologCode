filtmap :: (a -> Bool) -> (a -> b) -> [a] -> [b]


--with function composition
filtmap' :: (a -> Bool) -> (a -> b) -> [a] -> [b] 


--with foldr
map' :: (a->b) -> [a] -> [b] 


--with a l.c.
map'' :: (a->b) -> [a] -> [b] 


--with foldl
map''' :: (a->b) -> [a] -> [b] 


--foldr with conditional
filter' :: (a->Bool) -> [a] -> [a]


--with a l.c.
filter'' :: (a->Bool) -> [a] -> [a]

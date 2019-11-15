n = a `div` length xs
    where
       a = 10
       xs = [1,2,3,4,5]

last' xs = head (reverse xs)

last'' xs = xs !! (length xs -1)

last''' xs = drop (length xs -1) xs !! 0

last'''' = head.reverse

init' xs = take (length xs -1) xs

init'' xs = reverse $ tail (reverse xs )




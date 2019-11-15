n = a `div` length xs
    where
       a = 10
       xs = [1,2,3,4,5]

last' xs = head ( reverse xs )

last'' xs = head (drop (length xs -1) xs )

last''' xs = head $ reverse xs 

last'''' xs = head $drop  (length xs - 1 ) xs 

init' xs = reverse (tail (reverse xs ) )

init'' [_] = []
init'' (x:xs)  = (x: init'' xs)

init''' xs = take (length xs -  1 ) xs

init'''' = reverse.tail.reverse

init''''' xs = (reverse.tail.reverse) xs
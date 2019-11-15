
--q1 curried

mapfilter :: (a->b) -> (a->Bool) -> [a] -> [b]
mapfilter f p xs = map f (filter p xs)

mapfilter' f p = (map f ).(filter p)

fred = (+)

mapFold f xs = foldr ( \ y ys -> f y : ys) [] xs

filterFold p xs = foldr ff [] xs
    where
        ff = (\ y ys -> if p y then y: ys else ys)

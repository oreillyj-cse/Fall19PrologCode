--q1 curried

--q2 

mf f p xs = map f ( filter p xs)

mf' f p = (map f).(filter p)

--q3
map' f xs = foldr (\ y ys -> f y : ys) [] xs

filter' p xs = foldr (\ y ys -> if p y then y:ys else ys) [] xs
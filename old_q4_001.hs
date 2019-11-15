--q1
whatzygous :: Eq  a => a -> a -> String
whatzygous x y  = if x==y then "Homozygous" else "Heterozygous"

--guarded, not asked for
whatzygous' x y
    | x == y = "Homozygous"
    | otherwise = "Heterozygous"

--q2
tooHtooCoJR :: Int -> String
tooHtooCoJR t 
    | t >= 165 = "Too hot"
    | t < 95   = "Too Cold"
    | otherwise = ";)"


--q3
-- type ":t q3" in ghci
q3 = [('a',"acid"),('b',"base")]

--q4
cube:: Num a => a -> a
cube x = x*x*x

--q5
sum3 = \ x y z -> x+y+z

--q6
firstTen5NotEven = take 10 [ 5*x | x<-[1..], odd x]

firstTen5NotEven' = take 10 [ x | x<-[5,10..], odd x]

firstTen5NotEven'' = take 10 [ x | x<-[5,15..]]

--q1
whatzygous :: Eq a=> a-> a-> String
whatzygous a b = if a==b then "Homozygous" else "Heterozygous"

--q2
tooHotTooCoJR :: Int -> String
tooHotTooCoJR t 
    | t>=165 = "Too Hot"
    | t< 95  = "Too cold"
    | otherwise = "Just Right"

--q3
charString = [('t',"acid"),('b',"base")]

--q4
cube:: Num a => a-> a
cube x = x*x*x

--q5
lambdaAdd3 = \ x y z -> x+y+z

--q6
first105multsOf5NotEven = take 10 [ 5*i | i<-[1..], odd i]

first105multsOf5NotEven' = [ x | x<-[5,15..95] ]

first105multsOf5NotEven'' = [ 5+10*x | x<-[0..9] ]
posNegZero :: Int -> String
posNegZero n = if n > 0  then "Positive" else if n < 0 then "Negative" else "Zero" 

posNegZero' n
    | n > 0  = "Positive"
    | n < 0  = "Negative"
    | otherwise = "Zero"

xor :: Bool -> Bool -> Bool
xor a b  
    | a && b = False
    | otherwise = a || b

q3 = ( "fred", 'f') 


multDivSum x y = x*y `div` (x+y)

q5 = \ xs -> xs ++ reverse xs

q6= [ w:x:y:z:[] | w<-['0','1'],x<-['0','1'],y<-['0','1'],z<-['0','1']] 


q6'= [ w:x:y:z:[] | w<-bits,x<-bits,y<-bits,z<-bits] 
    where
        bits = ['0','1']

q6''= [ [w,x,y,z] | w<-['0','1'],x<-['0','1'],y<-['0','1'],z<-['0','1']] 
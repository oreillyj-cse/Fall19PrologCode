const' x = \_ ->x

null' [] = True
null' _ = False

null'' x = if x==[] then True else False

safetail xs = if null xs then [] else tail xs

safetail' xs
    | null xs = []
    | otherwise = tail xs

safetail'' [] = []
safetail'' xs = tail xs

(||) :: Bool -> Bool -> Bool
{--True  || True  = True
True  || False = True
False || True  = True 
False || False = False
--}
{--False || False = False
_ || _ = True
--}
False || a = a
a || False = a
_ || _ = True

(&&) :: Bool -> Bool -> Bool
{--(&&) x y = if x 
            then if y 
                then True 
                else False 
            else False
            --}
(&&) x y = if x then y else False




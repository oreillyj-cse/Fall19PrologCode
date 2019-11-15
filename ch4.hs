null' :: [a] -> Bool
null' [] = True
null' _  = False

null'' xs =  if length xs == 0 then True else False 

null''' xs = length xs == 0

safetail :: [a]->[a]
safetail xs = if null xs then [] else tail xs

safetail' xs 
 | null xs = []
 | otherwise = tail xs

safetail'' [] = []
safetail'' xs = tail xs

(||) :: Bool -> Bool -> Bool
--False || False = False
--False || True = True
--True || False = True
--True || True = True

--False || False = False
--_     ||   _   = True

False || b = b
_     ||   _   = True

(&&) :: Bool -> Bool -> Bool
--(&&) x y = if x then if y then True else False else False
(&&) x y = if x then y else False
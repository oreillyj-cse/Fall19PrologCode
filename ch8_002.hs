nat2int :: Nat -> Int
nat2int Zero     = 0
nat2int (Succ n) = 1 + nat2int n

int2nat :: Int -> Nat
int2nat 0 = Zero
int2nat n = Succ (int2nat (n-1))


data Nat = Zero | Succ Nat deriving Show

add :: Nat -> Nat -> Nat
add Zero     n = n
add (Succ m) n = Succ (add m n) 

mult:: Nat -> Nat -> Nat
mult Zero _ = Zero
mult (Succ m) n = add n (mult m n)


data Expr = Val Int
          | Add Expr Expr
          | Mul Expr Expr deriving Show

--folde


data Tree a = Nil 
            | Leaf a
            | Node (Tree a) a (Tree a) deriving Show

--complete
            
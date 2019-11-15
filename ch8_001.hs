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
mult Zero n = Zero
mult (Succ m) n = add n (mult m n)


data Expr = Val Int
          | Add Expr Expr
          | Mul Expr Expr deriving Show

slide18 = Add (Val 1) (Mul (Val 2) (Val 3))

folde valOp addOp mulOp (Val n) = valOp n
folde valOp addOp mulOp (Add a b) = addOp (fe a ) (fe b)
    where
        fe = folde valOp addOp mulOp
folde valOp addOp mulOp (Mul a b) = mulOp (fe a ) (fe b)
    where
        fe = folde valOp addOp mulOp


data Tree a = Nil 
            | Leaf a
            | Node (Tree a) a (Tree a) deriving Show

slide21 = Node (Node (Leaf 1)3(Leaf 4) ) 5 (Node (Leaf 6)7(Leaf 9))
slide21incomplete = Node (Node (Leaf 1)3 Nil ) 5 (Node (Leaf 6)7(Leaf 9))


complete Nil = True
complete (Leaf _) = True
complete (Node l _ r) = (complete l) && (complete r) && 
                        (size l) == (size r)

size Nil = 0
size (Leaf _)  = 1
size (Node l _ r) = (size l) + 1 + (size r)

            
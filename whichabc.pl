%input is positions of 3 mutually exclusive numbers, or anything redally, and another number (4th parameter).n The last term is the result you want.
whichabc(A,_,_,A,1).
whichabc(_,B,_,B,2).
whichabc(_,_,C,C,3).

% This is a list-based version of the blocks-world program.

% X appears before Y in list L.
before(X,Y,L) :- append(Z,[Y|_],L), append(_,[X|_],Z).

% The given blocks-world scene: three stacks of blocks
scene([[b1,b2],[b3,b4,b5,b6],[b7]]).

% above(X,Y) means that block X is somewhere above block Y.
above(X,Y) :- scene(L), member(Stack,L), before(X,Y,Stack).

% left(X,Y) means that block X is somewhere left of block Y. 
left(X,Y) :- scene(L), before(Stack1,Stack2,L), 
             member(X,Stack1), member(Y,Stack2).

right(Y,X) :- left(X,Y).

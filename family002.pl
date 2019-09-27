% This is the Prolog version of the family example

child(john,sue).   child(john,sam).   
child(jane,sue).   child(jane,sam).   
child(sue,george).   child(sue,gina). 

male(john).   male(sam).     male(george). 
female(sue).  female(jane).  female(june). 
%female(gina).

parent(Y,X) :- child(X,Y).
father(Y,X) :- child(X,Y), male(Y).
opp_sex(X,Y) :- male(X), female(Y). 
opp_sex(Y,X) :- male(X), female(Y). 
grand_father(X,Z) :- father(X,Y), parent(Y,Z).

mother(M,C) :- parent(M,C),female(M).

sibling(S1,S2) :- parent(P,S1),parent(P,S2),\+ S1 = S2.

person(P):-child(_,P).
person(P):-child(P,_).

all_gendered :- \+ (person(P),\+gendered(P)).

gendered(P):-person(P),male(P).
gendered(P):-person(P),female(P).
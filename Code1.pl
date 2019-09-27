% basic comparisons : < , > , >= , =< , =:= (negate last)

strictlyIncreasing(A,B,C):- A < B, B<C.

nonDecreasing(A,B,C) :- A =< B, B =< C.

% Y is 2, X is Y, \+ X =:= Y.


% try 30/4 , note floating point returned

%other ops available
%div(), also //, integer div., %mod
% note, basically a return (unusual)

% is vs =:= ( left hand of is can be unset for unificaiton)

quotient_remainder(X,Y,Q,R) :- Q is div(X,Y),R is mod(X,Y).

quotient_remainder2(X,Y,Q,R) :- Q is X // Y ,R is mod(X,Y).

%square function?
square(B,S) :- S is B*B.

%sqrt(N). Kind of pointless
square_root(S,SR) :- SR is sqrt(S).

%so, euclidean distance
euclidean_distance(AX,AY,BX,BY, D) :- Xdiff is BX-AX,Ydiff is BY-AY,
    D is sqrt(Xdiff*Xdiff+Ydiff*Ydiff).

factorial(0,1).
factorial(N,F) :- N > 0, R is N-1, factorial(R, RF), F is RF * N.

%so, what's power of a pow(A,P,A_to_the_P) ?
%yes ^ works in Prolog, but this is recursive...

power(A,1,A). %note trick here
power(A,P, A2P):- Pm1 is P-1,power(A,Pm1,A2Pm1),A2P is A*A2Pm1.

power2(A,1,A). %note trick here
power2(A,P, A2P):- power(A,P-1,A2Pm1),A2P is A*A2Pm1.

%define with power(A,0,1) ?

%so, what's blocks world?

%loc(b1,x,y) screen-coordinate order
loc(b1,0,2).
loc(b2,0,3).
loc(b3,1,0).
loc(b4,1,1).
loc(b5,1,2).
loc(b6,1,3).
loc(b7,2,3).

%generator for blocks?
block(B):-loc(B,_,_).

on(Bt,Bb):-loc(Bt,X,BtY),loc(Bb,X,BbY),BbY =:= BtY+1.

above(Bt,Bb):-loc(Bt,X,BtY),loc(Bb,X,BbY),BbY > BtY.

below(Bb,Bt):-above(Bt,Bb).

left(Bl,Br) :-loc(Bl,BlX,_),loc(Br,BrX,_),BlX < BrX.

%just left?

right(Br,Bl) :- left(Bl,Br).

on_the_table(B):-loc(B,_,3).

top_of_stack(B):-block(B),\+ on(_,B).



% LISTS (!!!, finally...)

% X = [1,2,3,4,5,6].

%really important
head_tail([H|T],H,T).
%note these examples:
% head_tail([1,2,3,4,5,6], H,T). , H is not list (in general), T is list
% head_tail([1], H,T). , T is empty list
% head_tail([], H,T). ,FAILS, H _must_ match at item and there's no
%     items...

%real predicate is length/2
length_list([],0).
length_list([_|T],L):-length_list(T,LT),L is LT+1.

%sum items in a list
sum_list([],0).
sum_list([H|T],S) :- sum_list(T,TSum),S is H+TSum.

%adjacent equals?
adjacent_equals([H,H|_]).
adjacent_equals([_,H|T]):-adjacent_equals([H|T]).

%class is_sorted (non-decreasing) order, multiple base cases
is_sorted([]).
is_sorted([_]).
is_sorted([A,B|T]):-A =< B, is_sorted([B|T]).% note =< , "guard", no need for failure case

%elem (real: member) -- test with M both set and unset
elem(M,[M|_]).
elem(M,[_|T]):-elem(M,T).

%concat (real, append)
%append([1,2,3], [4,5,6],C).
%append(A,B,[1,2,3,4,5,6]).
concat([],B,B).
concat([H|T],B,[H|TB]):-concat(T,B,TB).

%real predicate is reverse
rev([],[]).
rev([H|T],R):-rev(T,TR),append(TR,[H],R).%switch to concat to see diff vs rev2

% rev2 (library, example of accumulator pattern, also define helper rule
% (always okay)
rev2(L,R):-revAcc(L,R,[]).

revAcc([],Acc,Acc).
revAcc([H|T],R,Acc):-revAcc(T,R,[H|Acc]).

%subset -- multiple cases
subset([],[]).
subset([H|R],[H|T]):-subset(R,T).
subset([_|R],T):-subset(R,T).

%call following line:
% set_prolog_flag(answer_write_options,[max_depth(0)]).
merge_sort([],[]).
merge_sort([X],[X]).
merge_sort(X,S):-
    split(X,L,R),
    merge_sort(L,LS),merge_sort(R,RS),
    merge_lists(LS,RS,S). %merge is defined, btw.


take(0,_,[]).
% take(N,[H|T],[H|S]):-take(N-1,T,S). %watch out for this... doesn't
% evaluate expression (and does not unify...)
take(N,[H|T],[H|S]):-Nm1 is N-1,take(Nm1,T,S).

drop(0,T,T).
drop(N,[_|T],S):-Nm1 is N-1, drop(Nm1,T,S).

splitLessEfficient(List,L,R):-length(List,Len),N is Len//2,
                              take(N,List,L),drop(N,List,R).

% more efficient version (take, in particular, computes and then
% discards the drop answer).

%note use of helper predicate, below
split(List,L,R):-length(List,Len),N is Len//2,
                 split_N(N,List,L,R).

split_N(0,R,[],R).
split_N(N,[H|T],[H|S],R):-Nm1 is N-1,split_N(Nm1,T,S,R).

merge_lists(L,[],L).
merge_lists([],L,L).
merge_lists([H|T],[G|S],[H|M]):-H=<G,merge_lists(T,[G|S],M).
merge_lists([H|T],[G|S],[G|M]):-H>G,merge_lists([H|T],S,M).
%what happens if I do <, >= (sort NOT stable - 350)

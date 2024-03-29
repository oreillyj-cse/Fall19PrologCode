% basic comparisons : < , > , >= , =< , =:= (negate last)

strictlyIncreasing(A,B,C):- 

%nonDecreasing(A,B,C) :- 

% Y is 2, X is Y, \+ X =:= Y.


% try 30/4 , note floating point returned

%other ops available
%div(), also //, integer div., %mod
% note, basically a return (unusual)

% is vs =:= ( left hand of is can be unset for unificaiton)

%quotient_remainder(X,Y,Q,R) :- 

%quotient_remainder2(X,Y,Q,R) :- 

%square function?
%square(B,S) :- 

%sqrt(N). Kind of pointless
square_root(S,SR) :- SR is sqrt(S).

%factorial


%so, what's power of a pow(A,P,A_to_the_P) ?
%yes ^ works in Prolog, but this is recursive...

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
%block(B):-

%on(Bt,Bb):-

%above(Bt,Bb):-

%below(Bb,Bt):-

%left(Bl,Br) :-


%really important


%note these examples:
% head_tail([1,2,3,4,5,6], H,T). , H is not list (in general), T is list
% head_tail([1], H,T). , T is empty list
% head_tail([], H,T). ,FAILS, H _must_ match at item and there's no
%     items...
head_tail( [H|T],H,T).

%real predicate is length/2
list_length([],0).
list_length([_|T],L):- list_length(T,TL),L is TL+1.



%sum items in a list
sum_list([],0).
sum_list([H|T],S):-sum_list(T,TS),S is H + TS.


%adjacent equals?
adj_eq([X,X|_]).
adj_eq([_|T]):-adj_eq(T).

%class is_sorted (non-decreasing) order, multiple base cases


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
rev([H|T],R):-rev(T,RT),append(RT,[H],R).


% rev2 (library, example of accumulator pattern, also define helper rule
% (always okay)


%subset -- multiple cases
subset([],[]).
subset([H|T],[H|ST]) :-subset(T,ST).
subset([_|T],ST) :-subset(T,ST).

%disjoint
disjoint([],_).
disjoint([H|T],B) :- \+member(H,B),disjoint(T,B).

disjoint2(A,B ):- \+ (member(M,A),member(M,B)).

%intersects
intersect(A,B):- member(M,A),member(M,B).


max(X,Y,X):-X>Y.
max(X,Y,Y):-Y>=X.
%max of list
%maxL(L,Max)
maxL([X],X).
maxL([H|T], Max):-length(T,L),L>0,maxL(T,MT),max(MT,H,Max).

maxL2(L,Max):-member(Max,L), \+ (member(N,L),N>Max).

%
list_evil([e,v,i,l|_]).
list_evil([_|T]):-list_evil(T).

%call following line:
% set_prolog_flag(answer_write_options,[max_depth(0)]).


%take

% take(N,[H|T],[H|S]):-take(N-1,T,S). %watch out for this... doesn't
% evaluate expression (and does not unify...)
take(0,_,[]).
take(N,[H|T],TL):-Nm1 is N-1, take(Nm1,T,TTL), append([H],TTL,TL).

%drop
drop(0,L,L).
drop(N,[_|T],DL):-Nm1 is N-1, drop(Nm1,T,DL).


% split less efficient with take and drop
splitEvenly(AB,A,B):-length(AB,L),
                     Half is L//2,
                    take(Half,AB,A),drop(Half,AB,B).

% more efficient version (take, in particular, computes and then
% discards the drop answer).

%note use of helper predicate, below
%split
splitN(L,0,[],L).
splitN([H|T] ,N,A,B) :- Nm1 is N-1, splitN(T,Nm1,ST,B), append([H],ST,A).


%merge_lists
merge_lists([],L,L).
merge_lists(L,[],L).
merge_lists([G|R],[H|T],[G|MRest]):-G=<H,merge_lists(R,[H|T],MRest).
merge_lists([G|R],[H|T],[H|MRest]):-G>H,merge_lists([G|R],T,MRest).

%what happens if I do <, >= (sort NOT stable - 350)

merge_sort([],[]).
merge_sort([X],[X]).
merge_sort(L,Sorted):- 
    length(L,Len),Len>1,
    splitEvenly(L,Left,Right),
    merge_sort(Left,LSorted),
    merge_sort(Right,RSorted),
    merge_lists(LSorted,RSorted,Sorted).
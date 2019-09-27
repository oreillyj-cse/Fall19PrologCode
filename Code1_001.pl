% basic comparisons : < , > , >= , =< , =:= (negate last)

strictlyIncreasing(A,B,C):- A<B,B<C.

nonDecreasing(A,B,C) :- A=<B, B=<C.
    
%Y is 2, X is Y, \+ X =:= Y.
    
    
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
    
    %factorial
factorial(0,1).
factorial(N,F):-N>0,Nm1 is N-1, factorial(Nm1,Fsub), F is N*Fsub.
    
    
    %so, what's power of a pow(A,P,A_to_the_P) ?
    %yes ^ works in Prolog, but this is recursive...
    
    %power
power(_,0,1).
power(B,P,BP) :- P>0,Pm1 is P-1,power(B,Pm1,BPm1),BP is B*BPm1. 
power(B,P,BP) :- P<0,NegP is -1*P,power(B,NegP,BNegP), BP is 1/BNegP.
    
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
    
    on(Bt,Bb):-loc(Bt,X,Yt),loc(Bb,X,Yb),Yt =:= Yb+1.
    
    above(Bt,Bb):-loc(Bt,X,Yt),loc(Bb,X,Yb),Yt > Yb.
    
    below(Bb,Bt):-above(Bt,Bb).
    
    left(Bl,Br) :- loc(Bl,Xl,_),loc(Br,Xr,_),Xl<Xr.

    right(Br,Bl) :-left(Bl,Br).

    on_the_table(B):-block(B),\+above(_,B).

    on_the_table2(B) :- loc(B,_,3).

%really important


%note these examples:
% head_tail([1,2,3,4,5,6], H,T). , H is not list (in general), T is list
% head_tail([1], H,T). , T is empty list
% head_tail([], H,T). ,FAILS, H _must_ match at item and there's no
%     items...
head_tail([H|T],H,T).

%real predicate is length/2
length_list([],0).
length_list([_|T],Len):-length_list(T,LT),Len is 1 + LT.


%sum items in a list
sum_list([],0).
sum_list([H|T],S):-sum_list(T,ST),S is H+ST.


%adjacent equals?

adj_eq([H,H|_]).
adj_eq([_,H|T]):-adj_eq([H|T]).

%class is_sorted (non-decreasing) order, multiple base cases
is_sorted([]).
is_sorted([_]).
is_sorted([A,B|T]):-A =< B, is_sorted([B|T]).

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
rev([H|T], R ) :- rev(T,RT), append(RT,[H],R).


% rev2 (library, example of accumulator pattern, also define helper rule
% (always okay)


%subset -- multiple cases
%subset(Subset,Set)
subset([],[]).
subset([H|Sub],[H|Rest]):-subset(Sub,Rest).
subset(Sub,[_|Rest]):-subset(Sub,Rest).

%call following line:
% set_prolog_flag(answer_write_options,[max_depth(0)]).


%take
% take(2,[1,2,3,4], [1,2] ).
take(0,L,[]).
take(N,[H|T], L):-Nm1 is N-1, take(Nm1,T,TT),append([H],TT,L).

% take(N,[H|T],[H|S]):-take(N-1,T,S). %watch out for this... doesn't
% evaluate expression (and does not unify...)


%drop

% split less efficient with take and drop

% more efficient version (take, in particular, computes and then
% discards the drop answer).

%note use of helper predicate, below
%split


%merge_lists

%what happens if I do <, >= (sort NOT stable - 350)
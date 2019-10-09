
%1a ?- instance(Name,helmet,gold).
%1a ?- instance(_,helmet,gold).
%1b ?- instance(excalibur,_,Material).
%1c ?- instance(X,C,M),instance(Y,C,M), \+ X=Y.
%1d ?- instance(Name,_,M),\+material(M).


%fEXAMPLE tree
node(a,b,c).
node(b,d,e).
node(c,f,nil).
node(d,nil,nil).
node(e,nil,g).
node(f,nil,nil).
node(g,nil,nil).

parent(P,C) :- node(P,_,C).
parent(P,C) :- node(P,C,_).

descendant(D,A) :- parent(A,D),\+D=nil.
descendant(D,A) :- parent(P,D), descendant(P,A), \+D=nil.

flatten1([],[]).
flatten1( [H|T], HFT ) :- flatten1(T,FT), append(H,FT, HFT).

flattenAll([],[]).
flattenAll( [H|T], Flat ) :- is_list(H), 
    flattenAll(H,FH),
    flattenAll(T,FT), 
    append(FH,FT, Flat).
flattenAll( [H|T], [H|FT] ) :- \+ is_list(H), 
    flattenAll(T,FT).
  %  append([H],FT, Flat).    

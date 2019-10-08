
%1... see section 002

%2
dinnertable([c1,c2,c3,c4,c5,c6,c7]).

left(CA,CB):-dinnertable(DT),
    index_of(CA,DT,IA),
    index_of(CB,DT,IB),
    IA<IB.

index_of(M,[M|_],0).
index_of(M,[H|T],I):- \+M=H, index_of(M,T,IT),I is IT+1.

pass_to(c7,c1).
pass_to(CL,CR):-dinnertable(DT),inorder2(CL,CR,DT).s

inorder2(CL,CR,[CL,CR|_]).
inorder2(CL,CR,[_|T]):-inorder2(CL,CR,T).

%4 EXAMPLE tree
node(a,b,c).
node(b,d,e).
node(c,f,nil).
node(d,nil,nil).
node(e,nil,g).
node(f,nil,nil).
node(g,nil,nil).

parent(P,C):-node(P,C,_), \+C=nil.
parent(P,C):-node(P,_,C), \+C=nil.

descendant(D,A) :- parent(A,D).
descendant(D,A) :- parent(A,Y),descendant(D,Y).
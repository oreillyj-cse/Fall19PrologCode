edge(a,b).
edge(a,d).
edge(a,e).
edge(b,c).
edge(b,f).
edge(e,f).
edge(d,e).
edge(e,b).
edge(e,f).


no_self_loop(V) :- \+ edge(V,V).


%normally only care about claws on undirected graphs
%v1 - only outgoing edges
claw(V) :- edge(V,A),edge(V,B),edge(V,C),
           \+ A=B , \+ B=C , \+ C=A ,
           \+ edge(A,B), \+ edge(B,C), \+ edge(C,A),
           \+ edge(B,A), \+ edge(C,B), \+ edge(A,C). 

adj(A,B) :- edge(A,B).
adj(A,B) :- edge(B,A).

clawUndirected(V) :- adj(V,A),adj(V,B),adj(V,C),
           \+ A=B , \+ B=C , \+ C=A ,
           \+ adj(A,B), \+ adj(B,C), \+ adj(C,A).

n_away(V1,V2,1) :- edge(V1,V2).
n_away(V1,V2,N) :- edge(V1,A),Nm1 is N-1, n_away(A,V2,Nm1).

has_prefix(L,Prefix) :- append(Prefix,_,L).

sublist(L,Sub) :- append(A,B,L), append(Sub,_,B).

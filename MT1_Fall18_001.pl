

graph( [ [a,[b,d,e]], 
         [b,[c,f]], 
         [c,[]], 
         [d,[e]], 
         [e,[b,f]], 
         [f,[c]] ] ) .

%perhaps named poorly
% c depends on d, depends on f
depends_on(X,Y) :- graph(G), member([Y|[Nbors]],G),member(X,Nbors).

depends_on2(X,Y) :- graph(G), member([Y,Nbors],G),member(X,Nbors).

path_to(F,T) :- depends_on(T,F).
path_to(F,T) :- depends_on(G,F),path_to(G,T).
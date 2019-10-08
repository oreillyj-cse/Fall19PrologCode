edge(a,b).
edge(a,d).
edge(a,e).
edge(b,c).
edge(b,f).
edge(e,f).
edge(d,e).
edge(e,b).
edge(e,f).

no_incoming(V) :- edge(V,_), \+ edge(_,V).


cycle3(V1,V2,V3) :- edge(V1,V2),edge(V2,V3),edge(V3,V1).


is_power_of(1,_).
is_power_of(N,B):- 
    N > 1,
    Rem is mod(N,B), 
    Rem =:= 0 , 
    Div is N // B , 
    is_power_of(Div,B).


begin803([8,0,3|_]).
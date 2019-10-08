

graph( [ [a,[b,d,e]],[b,[c,f]],[c,[]],[d,[e]],[e,[b,f]],[f,[c]] ] ) .

depends_on(A,D) :- graph(G),member([A| [Ds]],G),member(D,Ds).

depends_on2(A,D) :- graph(G),member([A,Ds],G),member(D,Ds).

path_to(F,T) :- depends_on(F,T).
path_to(F,T) :- depends_on(F,A),path_to(A,T).

colorN(yellow). colorN(straw). colorN(brown).
colorBrussels(blue).
colorS(red). colorS(magenta). colorS(green). 

colorBelgium(WF,OF,A,Lim,FB,B,H,WB,N,Lut,Lux):-
    colorN(WF),colorN(OF),colorN(A),colorN(Lim),colorN(FB),
     \+ WF=OF , \+ OF=A , \+ OF=FB ,\+ A=FB , \+ Lim=A , \+ Lim=FB,
    colorBrussels(B),  
    colorS(H),colorS(WB),colorS(N),colorS(Lut),colorS(Lux),
    \+ H=WB , \+ H=N , \+ WB=N , \+ WB=Lut , \+ N=Lut, \+ Lut=Lux, \+ N= Lux .

% then do southern region

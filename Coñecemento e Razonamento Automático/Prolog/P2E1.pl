final(e3).
inicial(e1).

trans(e1,a,e1).
trans(e1,a,e2).
trans(e1,b,e1).
trans(e2,b,e3).
trans(e3,b,e4).
trans(e2,lambda,e4).
trans(e3,lambda,e1).

acepta(L) :- aceptacadena(e1,L).
aceptacadena(E,[]) :- final(E).
aceptacadena(E,[X|L]) :-  trans(E,X,E1), aceptacadena(E1,L).
aceptacadena(E,L) :- trans(E,lambda,E1), aceptacadena(E1,L).

aceptacadenalg(L,N) :- length(L,N), acepta(L).
aceptacadena_menor(L,N):- between(0,N,M), length(L,M),acepta(L).

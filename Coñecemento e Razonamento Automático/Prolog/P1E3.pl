arista(1,2).
arista(1,3).
arista(1,4).
arista(2,5).
arista(2,3).
arista(3,5).
arista(4,5).
arista(3,4).
arista(X,Y):- arista(Y,X).
conexion(X,Y) :- arista(X,Y) ; arista(Y,X).
camino(X,Y,Z):- encuentra_camino(X,Y,[X],W),reverse(W,Z).
encuentra_camino(A,B,C,[B|C]):- conexion(A,B).
encuentra_camino(A,B,VISITADO,CAM) :- conexion(A,C), C\==B, not(member(C,VISITADO)), encuentra_camino(C,B,[C|VISITADO],CAM).

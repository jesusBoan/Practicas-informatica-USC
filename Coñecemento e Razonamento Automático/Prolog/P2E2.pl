movimiento(estado(medio,en_silla,medio,sin_platanos),
   coge_platanos,
   estado(medio,en_silla,medio,con_platanos)).
movimiento(estado(P,en_suelo,P,H),
   sube_silla,
   estado(P,en_silla,P,H)).
movimiento(estado(P1,en_suelo,P1,H),
   empuja(P1,P2),
   estado(P2,en_suelo,P2,H)).
movimiento(estado(P1,en_suelo,B,H),
   mover(P1,P2),
   estado(P2,en_suelo,B,H)).
solucion(estado(_,_,_,con_platanos)).
solucion(Estado1) :-
   movimiento(Estado1,_,Estado2),
   solucion(Estado2).

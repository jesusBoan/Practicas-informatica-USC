(deffacts BH_inicial
	(tiene-pelo robbie)
	(tiene-pezunas robbie)
	(tiene-rayas-negras robbie))

(defrule R1
	(tiene-pelo ?a)
=> (assert (mamifero ?a)))


(defrule R2
	(leche ?a)
=> (assert (mamifero ?a)))


(defrule R3
	(mamifero ?a)
	(tiene-pezunas ?a)
=> (assert (ungulado ?a)))


(defrule R4
	(mamifero ?a)
	(rumia ?a)
=> (assert (ungulado ?a)))


(defrule R5
	(ungulado ?a)
	(tiene-cuello-largo ?a)
=> (assert (jirafa ?a)))


(defrule R6
	(ungulado ?a)
	(tiene-rayas-negras ?a)
=> (assert (cebra ?a)))
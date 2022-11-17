(deffacts BH_inicial
	(tiene-pelo robbie)
	(tiene-manchas-oscuras robbie)
	(come-carne robbie)
    (tiene-color-leonardo robbie)
    (tiene-plumas suzie)
    (vuela-bien suzie)
    (es-padre suzie pancho))

(defrule R1
	(tiene-pelo ?a)
=> (assert (mamifero ?a)))


(defrule R2
	(da-leche ?a)
=> (assert (mamifero ?a)))


(defrule R3
	(tiene-plumas ?a)
=> (assert (ave ?a)))


(defrule R4
	(vuela ?a)
	(pone-huevos ?a)
=> (assert (ave ?a)))


(defrule R5
	(come-carne ?a)
=> (assert (carnivoro ?a)))


(defrule R6
	(dientes-puntiagudos ?a)
	(tiene-garras ?a)
    (ojos-al-frente ?a)
=> (assert (carnivoro ?a)))


(defrule R7
	(mamifero ?a)
	(tiene-pezunas ?a)
=> (assert (ungulado ?a)))


(defrule R8
	(mamifero ?a)
	(rumia ?a)
=> (assert (ungulado ?a)))


(defrule R9
	(mamifero ?a)
	(carnivoro ?a)
    (tiene-color-leonardo ?a)
    (tiene-manchas-oscuras ?a)
=> (assert (especie leopardo ?a)))


(defrule R10
	(mamifero ?a)
	(carnivoro ?a)
    (tiene-color-leonardo ?a)
    (tiene-rayas-negras ?a)
=> (assert (especie tigre ?a)))


(defrule R11
	(ungulado ?a)
	(tiene-cuello-largo ?a)
    (tiene-piernas-largas ?a)
    (tiene-manchas-oscuras ?a)
=> (assert (especie jirafa ?a)))


(defrule R12
	(ungulado ?a)
	(tiene-rayas-negras ?a)
=> (assert (especie cebra ?a)))


(defrule R13
	(ave ?a)
	(not (vuela ?a))
    (tiene-cuello-largo ?a)
    (tiene-piernas-largas ?a)
    (tiene-color-blanco ?a)
    (tiene-color-negro ?a)
=> (assert (especie avestruz ?a)))


(defrule R14
	(ave ?a)
	(not (vuela ?a))
    (nada ?a)
    (tiene-color-blanco ?a)
    (tiene-color-negro ?a)
=> (assert (especie pingüino ?a)))


(defrule R15
	(ave ?a)
	(vuela-bien ?a)
=> (assert (especie albatros ?a)))


(defrule R16
	(es-padre ?p ?h)
    (especie ?e ?p)
=> (assert (especie ?e ?h)))



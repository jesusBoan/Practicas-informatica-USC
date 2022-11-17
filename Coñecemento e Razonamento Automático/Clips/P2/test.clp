(deffacts BH_inicial
	(animal Tucky)
	(animal Piolin)
	(esqueleto Piolin si)
	(esqueleto Tucky si)
	(ladra Tucky))

(defrule R1
	(animal ?a)
	(esqueleto ?a si)
=> (assert (vertebrado ?a)))

(defrule R2
	(animal ?a)
	(esqueleto ?a no)
=> (assert (invertebrado ?a)))

(defrule R3
	(vertebrado ?a)
	(ladra ?a)
=> (assert (perro ?a)))
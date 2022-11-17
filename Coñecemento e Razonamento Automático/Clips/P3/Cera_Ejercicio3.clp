(deftemplate Paciente    
    (slot fiebre (type SYMBOL)(allowed-symbols alta moderada baja no) (default no))    
    (slot sarpullido (type SYMBOL)(allowed-symbols si no) (default no))
    (slot exantema (type SYMBOL)(allowed-symbols si no) (default no))
    (slot garganta-irritada (type SYMBOL)(allowed-symbols si no) (default no))
    (slot vacunado (type SYMBOL)(allowed-symbols si no) (default no))
    (slot id (type LEXEME))
    )

(defrule Sarampion    
    (Paciente (fiebre alta) (exantema si) (vacunado no) (id ?x))
    =>
    (assert (diagnostico ?x sarampion))
    (printout t "Diagnostico del paciente " ?x ":Sarampion" crlf))

(defrule Alergia1   
    (Paciente (fiebre ~alta) (exantema si)(id ?x))
    =>
    (assert (diagnostico ?x alergia))
    (printout t "Diagnostico del paciente " ?x ":Alergia" crlf))

(defrule Alergia2   
    (Paciente (exantema si) (vacunado si) (id ?x))
    =>
    (assert (diagnostico ?x alergia))
    (printout t "Diagnostico del paciente " ?x ":Alergia" crlf))

(defrule Alergia3
    (Paciente (sarpullido si)(exantema no)(fiebre no)(garganta-irritada no) (id ?x))
    =>
    (assert (diagnostico ?x alergia))
    (printout t "Diagnostico del paciente " ?x ":Alergia" crlf))
    
(defrule GripeComun
    (Paciente (fiebre alta|moderada) (garganta-irritada si) (id ?x))
    =>
    (assert (diagnostico ?x gripe_comun))
    (printout t "Diagnostico del paciente " ?x ":Gripe Comun" crlf))


(defrule TratamientoSarampion
    (diagnostico ?x sarampion)
    =>
    (assert (tratamiento ?x descanso_y_tratamiento_ayuda))
    (printout t "Tratamiento del paciente " ?x ":Descanso y tratamiento de ayuda" crlf))

(defrule TratamientoAlergia
    (diagnostico ?x alergia)
    =>
    (assert (tratamiento ?x antihistaminicos))
    (printout t "Tratamiento del paciente " ?x ":Antihistaminico" crlf))

(defrule TratamientoGripe
    (diagnostico ?x gripe_comun)
    =>
    (assert (tratamiento ?x descanso_cama))
    (printout t "Tratamiento del paciente " ?x ":Descanso en la cama" crlf))
(deftemplate Paciente    
    (slot fiebre (type SYMBOL)(allowed-symbols alta moderada baja no nil) (default nil))
    (slot temperatura)    
    (slot sarpullido (type SYMBOL)(allowed-symbols si no nil) (default nil))
    (slot exantema (type SYMBOL)(allowed-symbols si no nil) (default nil))
    (slot garganta-irritada (type SYMBOL)(allowed-symbols si no nil)(default nil))
    (slot vacunado (type SYMBOL)(allowed-symbols si no nil) (default nil))
    (slot id (type SYMBOL))
    (slot diagnostico (type SYMBOL)(default nil))
    )
    


(defrule Rinicial
    ?p <- (Paciente (id ?x)(exantema nil)(diagnostico nil))
    => 
    (printout t "Presenta manchas rojas en la piel? (exantema): ")
    (bind ?t (read))
    (modify ?p (exantema ?t))
    )

(defrule Rinicial2
    ?p <- (Paciente (id ?x)(exantema no)(diagnostico nil)(fiebre nil))
    => 
    (printout t "Entra la temperatura del paciente: ")
    (bind ?t (read))
    (modify ?p (temperatura ?t))
    )
(defrule Rinicial3
    ?p <- (Paciente (id ?x)(exantema no)(fiebre alta|moderada|baja|no)(diagnostico nil)(garganta-irritada nil))
    => 
    (printout t "Tiene la garganta irritada?: ")
    (bind ?t (read))
    (modify ?p (garganta-irritada ?t))
    )
(defrule Rinicial4
    ?p <- (Paciente (id ?x)(exantema no)(fiebre no)(garganta-irritada no)(diagnostico nil)(sarpullido nil))
    => 
    (printout t "Tiene sarpullido?: ")
    (bind ?t (read))
    (modify ?p (sarpullido ?t))
    )

(defrule NoDiagnostico1
    ?p <- (Paciente (id ?x)(exantema no)(fiebre no)(garganta-irritada no)(diagnostico nil)(sarpullido no))
    => 
    (printout t "No hay diagnostico para el paciente " ?x crlf)
    (modify ?p (diagnostico no))
    )
(defrule NoDiagnostico2
    ?p <- (Paciente (id ?x)(exantema no)(fiebre moderada|baja|no)(garganta-irritada si)(diagnostico nil)(sarpullido no))
    => 
    (printout t "No hay diagnostico para el paciente " ?x crlf)
    (modify ?p (diagnostico no))
    )
(defrule NoDiagnostico3
    ?p <- (Paciente (id ?x)(exantema no)(fiebre alta|moderada|baja)(garganta-irritada no)(diagnostico nil)(sarpullido nil))
    => 
    (printout t "No hay diagnostico para el paciente " ?x crlf)
    (modify ?p (diagnostico no))
    )


(defrule Rinicial5
    ?p <- (Paciente (id ?x)(exantema si)(diagnostico nil)(vacunado nil))
    => 
    (printout t "Esta vacunado contra el sarampion?: ")
    (bind ?t (read))
    (modify ?p (vacunado ?t))
    )
(defrule Rinicial6
    ?p <- (Paciente (id ?x)(exantema si)(vacunado no)(diagnostico nil)(fiebre nil)(temperatura nil))
    => 
    (printout t "Entra la temperatura del paciente: ")
    (bind ?t (read))
    (modify ?p (temperatura ?t))
    )
(defrule ValorFiebre
    ?p <- (Paciente (temperatura ?t)(fiebre nil))
    (test (numberp ?t))
    (test (< ?t 36.7))
    =>
    (modify ?p (fiebre no))
)

(defrule ValorFiebre2
    ?p <- (Paciente (temperatura ?t)(fiebre nil))
    (test (numberp ?t))
    (test (<= ?t 37.5))
    (test (>= ?t 36.7))
    =>
    (modify ?p (fiebre baja))
)

(defrule ValorFiebre3
    ?p <- (Paciente (temperatura ?t)(fiebre nil))
    (test (numberp ?t))
    (test (> ?t 37.6))
    (test (<= ?t 39))
    =>
    (modify ?p (fiebre moderada))
)

(defrule ValorFiebre4
    ?p <- (Paciente (temperatura ?t)(fiebre nil)(id ?x))
    (test (numberp ?t))
    (test (> ?t 39))
    =>
    (modify ?p (fiebre alta))
)
(defrule Sarampion    
    ?p <- (Paciente (fiebre alta) (exantema si) (vacunado no) (id ?x)(diagnostico nil))
    =>
    (modify ?p (diagnostico sarampion))
    (printout t "Diagnostico del paciente " ?x ":Sarampion" crlf))

(defrule Alergia1   
    ?p <- (Paciente (fiebre ~alta) (exantema si) (vacunado no) (id ?x)(diagnostico nil))
    =>
    (modify ?p (diagnostico alergia))
    (printout t "Diagnostico del paciente " ?x ":Alergia" crlf))
(defrule Alergia2   
    ?p <- (Paciente (exantema si) (vacunado si) (id ?x)(diagnostico nil))
    =>
    (modify ?p (diagnostico alergia))
    (printout t "Diagnostico del paciente " ?x ":Alergia" crlf))

(defrule Alergia3
    ?p <- (Paciente (sarpullido si)(exantema no)(fiebre no)(garganta-irritada no) (id ?x)(diagnostico nil) )
    =>
    (modify ?p (diagnostico alergia))
    (printout t "Diagnostico del paciente " ?x ":Alergia" crlf))
    
(defrule GripeComun
    ?p <- (Paciente (fiebre alta|moderada)(garganta-irritada si)(exantema no)(id ?x)(diagnostico nil))
    =>
    (modify ?p (diagnostico gripe_comun))
    (printout t "Diagnostico del paciente " ?x ":Gripe Comun" crlf))


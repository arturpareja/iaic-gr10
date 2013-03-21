;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Practica 2: 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Modulo MAIN

(deftemplate persona
  (slot nombre (default "sin-nombre")) ; string
  (slot sexo) ; h-m
  (slot edad) ; num
  (slot altura) ; num
  (slot peso) ; num
  (slot cuesta_hablar) ; bool
  (slot gusta_salir) ; bool
  (slot amigos)	; num
  (slot religion) ; strings
  (slot twitter) ; bool
  (slot facebook) ; bool
  (slot timido)	; bool
  (slot sociable) ; bool
  (slot muchos-amigos) ; bool
  (slot caracter) ;introvertido, extrovertido, inclasificable
)

(deftemplate compatibles
	(slot persona1) 
	(slot persona2) 
)

(deftemplate citados
	(slot persona1) 
	(slot persona2) 
)


(deffacts participantes
	;(persona (nombre "arturo")(sexo "h")(edad 24)(altura 173)(peso 73)(cuesta_hablar TRUE)(gusta_salir TRUE)(amigos 21)(religion "ninguna")(twitter TRUE)(facebook TRUE)(timido TRUE)(sociable FALSE)(muchos-amigos TRUE)(caracter introvertido))
	
  (persona (nombre "alguien1")(sexo "h")(edad 24)(altura 173)(peso 73)(cuesta_hablar FALSE)(gusta_salir TRUE)(amigos 2)(religion "ninguna")(twitter TRUE)(facebook TRUE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "alguien2")(sexo "m")(edad 24)(altura 173)(peso 73)(cuesta_hablar FALSE)(gusta_salir TRUE)(amigos 2)(religion "ninguna")(twitter TRUE)(facebook TRUE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "alguien3")(sexo "h")(edad 24)(altura 173)(peso 73)(cuesta_hablar FALSE)(gusta_salir FALSE)(amigos 22)(religion "catolica")(twitter TRUE)(facebook TRUE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "alguien4")(sexo "m")(edad 24)(altura 173)(peso 73)(cuesta_hablar FALSE)(gusta_salir FALSE)(amigos 22)(religion "ninguna")(twitter TRUE)(facebook TRUE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "alguien5")(sexo "h")(edad 84)(altura 173)(peso 73)(cuesta_hablar FALSE)(gusta_salir FALSE)(amigos 22)(religion "catolica")(twitter TRUE)(facebook TRUE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "alguien6")(sexo "m")(edad 54)(altura 173)(peso 73)(cuesta_hablar FALSE)(gusta_salir FALSE)(amigos 22)(religion "ninguna")(twitter TRUE)(facebook TRUE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
)

(defglobal ?*crlf* = "
")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Modulo clasificar

(defmodule clasificar)

;Si a una persona Ie cuesta hablar con la gente entonces es tímida.
(defrule timidez
  ?persona <-(persona(cuesta_hablar ?c))
  =>
  (modify ?persona (timido ?c)) ;modificar el slot timidez con el valor de cuesta_hablar
  (assert(disparada timido ?persona))
)

;Una persona tiene muchos amigos si tiene más de veinte amigos
(defrule muchos-amigos
  ?persona <-(persona(amigos ?a))
  =>
  (modify ?persona (muchos-amigos (> ?a 20)) )
  (assert(disparada muchos-amigos ?persona))
)

;Si una persona tiene muchos amigos, está en Tweeter y en Facebook entonces es muy sociable.
(defrule actitud-sociable
  ?persona <-(persona(twitter ?tw)(facebook ?fc)(muchos-amigos ?m))
  (disparada muchos-amigos ?persona)
  =>
  (modify ?persona (sociable (and ?m (and ?tw ?fc))))
  (assert (disparada sociable ?persona))
)

; Si a una persona le gusta salir y es muy sociable entonces es carácter extrovertido.
(defrule caracter-extrovertido
   ?persona <- (persona(gusta_salir ?gus&:(eq ?gus TRUE))(sociable ?soc&:(eq ?soc TRUE)))
   (disparada sociable ?persona)
   =>
   (modify ?persona (caracter extrovertido))
   (assert(disparada extrovertido ?persona))
)

;Si una persona es tímida y tiene pocos amigos entonces es carácter introvertido.
(defrule caracter-introvertido
	?persona <- (persona(timido ?tim&:(eq ?tim TRUE))(muchos-amigos ?muc&:(eq ?muc FALSE)))
	(disparada timido ?persona)
	(disparada muchos-amigos ?persona)
	=>
	(modify ?persona (caracter introvertido))
	(assert(disparada introvertido ?persona))
)

;Si una persona no se puede clasificar como introvertida o extrovertida entonces es no clasificable.
(defrule caracter-inclasificable
	?persona <- (persona)
	(not (disparada extrovertido ?persona))
	(not (disparada introvertido ?persona))
	=>
	(modify ?persona (caracter inclasificable))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Modulo compatibilizar
(defmodule compatibilizar)

;Dos personas son compatibles si tienen distinto sexo, la misma religión y son ambas introvertidas, extrovertidas, o no clasificables.
(defrule compatibles1
	?p1 <- (persona(nombre ?nom1)(sexo ?sex1 )(religion ?rel1 ) (caracter ?car))
	?p2 <- (persona(nombre ?nom2)(sexo ?sex2 )(religion ?rel2 ) (caracter ?car))
	(test(<> ?sex1 ?sex2))
	(test (= (str-compare ?rel1 ?rel2) 0))
	;solo se comprueba a la hora de hacer las citas
	;(not (compatibles ?persona1 ?persona2))
	;(not (compatibles ?persona2 ?persona1))
	=>
	(assert(compatibles(persona1 ?p1)(persona2 ?p2)))
)
;También consideramos compatibles a las que ambas son no-clasificables, tienen distinto sexo, distinta religión, y tienen muchos Amigos.
(defrule compatibles2
	?p1 <- (persona(nombre ?nom1)(sexo ?sex1 )(religion ?rel1 )(muchos-amigos ?muc)(caracter ?car))
	?p2 <- (persona(nombre ?nom2)(sexo ?sex2 )(religion ?rel2 )(muchos-amigos ?muc)(caracter ?car))
	(test(<> ?sex1 ?sex2))
	(test (<> (str-compare ?rel1 ?rel2) 0))
	(test (eq ?car inclasificable))
	(test (eq ?muc TRUE))
	=>
	(assert(compatibles(persona1 ?p1)(persona2 ?p2)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Modulo citar
(defmodule citar)

;Se puede concertar una cita si dos personas son compatibles, siempre que su diferencia de edad sea menor de 10 años. Sólo se citan una vez a las mismas dos personas.
(defrule citar1
	?p1<-(persona(nombre ?nom1)(edad ?eda1))
	?p2<-(persona(nombre ?nom2)(edad ?eda2))
	(compatibles (persona1 ?p1)(persona2 ?p2))
	(test (< (abs (- ?eda1 ?eda2)) 10))
	(not (citados (persona1 ?p1)))
	(not (citados (persona2 ?p1)))
	(not (citados (persona2 ?p2)))
	(not (citados (persona1 ?p2)))
	=>
	(assert(citados(persona1 ?p1)(persona2 ?p2)))
	(printout t ?nom1 " y " ?nom2 " estan citados ou yeah" crlf)
)

;También citamos a las personas compatibles con diferencia de edad mayor de 10 años si su edad está por encima de los 50 años.
(defrule citar2
	?p1<-(persona(nombre ?nom1)(edad ?eda1))
	?p2<-(persona(nombre ?nom2)(edad ?eda2))
	(compatibles (persona1 ?p1)(persona2 ?p2))
	(test (and (> ?eda1 50)(> ?eda2 50)))
	(test (> (abs (- ?eda1 ?eda2)) 10))
	(not (citados (persona1 ?p1)))
	(not (citados (persona2 ?p1)))
	(not (citados (persona2 ?p2)))
	(not (citados (persona1 ?p2)))
	=>
	(assert(citados(persona1 ?p1)(persona2 ?p2)))
	(printout t ?nom1 " y " ?nom2 " estan citados ou yeah" crlf)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Modulo printear
(defmodule printear)
(defrule mostrar-template
	?persona <-(persona (nombre ?nom)(sexo ?sex)(edad ?eda)(altura ?alt)(peso ?pes)(cuesta_hablar ?cue)(gusta_salir ?gus)(amigos ?ami)(religion ?rel)(twitter ?twi)(facebook ?fac)(timido ?tim)(sociable ?soc)(muchos-amigos ?muc)(caracter ?car))
	=>
	(printout t "[nombre "?nom ", sexo " ?sex ", edad " ?eda ", altura " ?alt ", peso "?pes ", cuesta_hablar " ?cue ", gusta_salir " ?gus ", num amigos " ?ami ", religion " ?rel ", twitter " ?twi ", facebook" ?fac ", timido "?tim ", sociable " ?soc ", muchos_amigos " ?muc ", caracter " ?car "]"  crlf)
)

(defrule mostrar-compatible1
	?p1<-(persona(nombre ?nom1))
	?p2<-(persona(nombre ?nom2))
	(compatibles (persona1 ?p1)(persona2 ?p2))
	=>
	(printout t ?nom1 " y " ?nom2 " son compatibles ^^" crlf)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Programa

(deffunction run-system ()
  (reset)
  (focus clasificar compatibilizar citar printear)
  (run)
  (facts)
)

;(while TRUE
  (run-system);)
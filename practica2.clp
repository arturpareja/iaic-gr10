;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Practica 2: 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Modulo MAIN

(deftemplate persona
  (slot nombre(type SYMBOL)(default "participante")) ;string
  (slot sexo  (type SYMBOL)) ;h-m
  (slot edad  (type NUMBER)(default 25))  ;num
  (slot altura(type NUMBER)(default 170)) ;num
  (slot peso  (type NUMBER)(default 60))  ;num
  (slot cuesta_hablar(type SYMBOL)(default FALSE)) ;bool
  (slot gusta_salir  (type SYMBOL)(default FALSE)) ;bool
  (slot amigos(type NUMBER)(default 5))	;num
  (slot religion(type SYMBOL)(default "ninguna")) ;string
  (slot twitter (type SYMBOL)(default FALSE)) ;bool
  (slot facebook(type SYMBOL)(default FALSE)) ;bool
  (slot timido  (type SYMBOL))	    ;bool
  (slot sociable(type SYMBOL))      ;bool
  (slot muchos-amigos(type SYMBOL)) ;bool
  (slot caracter(type SYMBOL)) ;introvertido extrovertido inclasificable
)

(deftemplate compatibles
	(slot persona1) ;template persona
	(slot persona2) ;template persona
  (slot afinidad(type NUMBER)) ;num 
)

(deftemplate citados
	(slot persona1) ;template persona
	(slot persona2) ;template persona
  (slot tipo-cita(type SYMBOL)) ;normal magica 
)


(deffacts participantes
	
  (persona (nombre "alguien1")(sexo h)(edad 24)(altura 173)(peso 73)(cuesta_hablar FALSE)(gusta_salir TRUE)(amigos 2)(religion "ninguna")(twitter TRUE)(facebook TRUE))
  
  (persona (nombre "alguien2")(sexo m)(edad 24)(altura 173)(peso 73)(cuesta_hablar FALSE)(gusta_salir TRUE)(amigos 2)(religion "ninguna")(twitter TRUE)(facebook TRUE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "alguien3")(sexo h)(edad 24)(altura 173)(peso 73)(cuesta_hablar FALSE)(gusta_salir FALSE)(amigos 22)(religion "catolica")(twitter TRUE)(facebook TRUE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "alguien4")(sexo m)(edad 24)(altura 173)(peso 73)(cuesta_hablar FALSE)(gusta_salir FALSE)(amigos 22)(religion "ninguna")(twitter TRUE)(facebook TRUE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "alguien5")(sexo h)(edad 84)(altura 173)(peso 73)(cuesta_hablar FALSE)(gusta_salir FALSE)(amigos 22)(religion "catolica")(twitter TRUE)(facebook TRUE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "alguien6")(sexo m)(edad 54)(altura 173)(peso 73)(cuesta_hablar FALSE)(gusta_salir FALSE)(amigos 22)(religion "ninguna")(twitter TRUE)(facebook TRUE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
)

(defglobal ?*crlf* = "
")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Modulo clasificar

(defmodule clasificar)

;Si a una persona le cuesta hablar con la gente entonces es tímida.
(defrule timidez
  (declare (salience 100))
  ?persona <-(persona(cuesta_hablar ?c))
  =>
  (modify ?persona (timido ?c)) ;modificar el slot timidez con el valor de cuesta_hablar
)

;Una persona tiene muchos amigos si tiene más de veinte amigos
(defrule muchos-amigos
  (declare (salience 99))
  ?persona <-(persona(amigos ?a))
  =>
  (modify ?persona (muchos-amigos (> ?a 20)) )
)

;Si una persona tiene muchos amigos, está en Tweeter y en Facebook entonces es muy sociable.
(defrule actitud-sociable
  (declare (salience 98))
  ?persona <-(persona(twitter ?tw)(facebook ?fc)(muchos-amigos ?m))
  =>
  (modify ?persona (sociable (and ?m (and ?tw ?fc))))
)

;Si a una persona le gusta salir y es muy sociable entonces es carácter extrovertido.
(defrule caracter-extrovertido
  (declare (salience 97))
   ?persona <- (persona(gusta_salir ?gus&:(eq ?gus TRUE))(sociable ?soc&:(eq ?soc TRUE)))
   =>
   (modify ?persona (caracter extrovertido))
)

;Si una persona es tímida y tiene pocos amigos entonces es carácter introvertido.
(defrule caracter-introvertido
  (declare (salience 97))
	?persona <- (persona(timido ?tim&:(eq ?tim TRUE))(muchos-amigos ?muc&:(eq ?muc FALSE)))
	=>
	(modify ?persona (caracter introvertido))
)

;Si una persona no se puede clasificar como introvertida o extrovertida entonces es no clasificable.
(defrule caracter-inclasificable
  (declare (salience 96))
	?persona <- (persona(caracter ?caract))
  (test(neq ?caract extrovertido))
  (test(neq ?caract introvertido))
	=>
	(modify ?persona (caracter inclasificable))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Modulo compatibilizar
(defmodule compatibilizar)

;Dos personas son compatibles si tienen distinto sexo, la misma religión y son ambas introvertidas, extrovertidas, o no clasificables.
(defrule compatibles1
	?p1 <- (persona(nombre ?nom1)(sexo ?sex1 )(religion ?rel1 ) (caracter ?caract))
	?p2 <- (persona(nombre ?nom2)(sexo ?sex2 )(religion ?rel2 ) (caracter ?caract))
  (test(or (eq ?caract inclasificable)(or (eq ?caract extrovertido)(eq ?caract introvertido))))
	(test(<> ?sex1 ?sex2))
	(test (= (str-compare ?rel1 ?rel2) 0))
	;solo se comprueban duplicados a la hora de hacer las citas
	=>
	(assert(compatibles(persona1 ?p1)(persona2 ?p2)))
)
;También consideramos compatibles a las que ambas son no-clasificables, tienen distinto sexo, distinta religión, y tienen muchos Amigos.
(defrule compatibles2
	?p1 <- (persona(nombre ?nom1)(sexo ?sex1 )(religion ?rel1 )(muchos-amigos ?muc)(caracter ?caract))
	?p2 <- (persona(nombre ?nom2)(sexo ?sex2 )(religion ?rel2 )(muchos-amigos ?muc)(caracter ?caract))
	(test(<> ?sex1 ?sex2))
	(test (<> (str-compare ?rel1 ?rel2) 0))
	(test (eq ?caract inclasificable))
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
  ;Sólo se citan una vez a las mismas dos personas.
	(not (citados (persona1 ?p1)(persona2 ?p2)))
  (not (citados (persona1 ?p2)(persona2 ?p1)))
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
  ;Sólo se citan una vez a las mismas dos personas.
	(not (citados (persona1 ?p1)(persona2 ?p2)))
  (not (citados (persona1 ?p2)(persona2 ?p1)))
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
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
  (slot afinidad(type NUMBER)(default 0)) ;num 
)

(deftemplate citados
	(slot persona1) ;template persona
	(slot persona2) ;template persona
  (slot tipo-cita(type SYMBOL)) ;normal magica 
)


(deffacts participantes
  
  (persona (nombre "persona1")(sexo h)(edad 31)(altura 184)(peso 80)(cuesta_hablar FALSE)(gusta_salir TRUE)(amigos 10)(religion "ninguna")(twitter FALSE)(facebook TRUE))
  
  (persona (nombre "persona2")(sexo m)(edad 30)(altura 170)(peso 67)(cuesta_hablar FALSE)(gusta_salir TRUE)(amigos 12)(religion "judia")(twitter TRUE)(facebook TRUE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "persona3")(sexo h)(edad 44)(altura 163)(peso 60)(cuesta_hablar TRUE)(gusta_salir FALSE)(amigos 9)(religion "catolica")(twitter TRUE)(facebook FALSE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "persona4")(sexo m)(edad 24)(altura 154)(peso 64)(cuesta_hablar FALSE)(gusta_salir TRUE)(amigos 22)(religion "islamica")(twitter FALSE)(facebook TRUE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "persona5")(sexo h)(edad 84)(altura 172)(peso 74)(cuesta_hablar TRUE)(gusta_salir FALSE)(amigos 13)(religion "catolica")(twitter FALSE)(facebook TRUE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "persona6")(sexo m)(edad 54)(altura 187)(peso 86)(cuesta_hablar TRUE)(gusta_salir FALSE)(amigos 4)(religion "judia")(twitter TRUE)(facebook FALSE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "persona7")(sexo h)(edad 45)(altura 190)(peso 57)(cuesta_hablar TRUE)(gusta_salir TRUE)(amigos 7)(religion "budista")(twitter FALSE)(facebook TRUE))
  
  (persona (nombre "persona8")(sexo m)(edad 51)(altura 157)(peso 94)(cuesta_hablar FALSE)(gusta_salir TRUE)(amigos 16)(religion "judia")(twitter FALSE)(facebook TRUE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "persona9")(sexo h)(edad 26)(altura 200)(peso 73)(cuesta_hablar FALSE)(gusta_salir FALSE)(amigos 26)(religion "catolica")(twitter FALSE)(facebook FALSE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "persona10")(sexo m)(edad 72)(altura 175)(peso 74)(cuesta_hablar TRUE)(gusta_salir TRUE)(amigos 5)(religion "ninguna")(twitter TRUE)(facebook TRUE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "persona11")(sexo h)(edad 65)(altura 175)(peso 63)(cuesta_hablar FALSE)(gusta_salir FALSE)(amigos 26)(religion "catolica")(twitter TRUE)(facebook FALSE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "persona12")(sexo m)(edad 54)(altura 163)(peso 81)(cuesta_hablar FALSE)(gusta_salir FALSE)(amigos 23)(religion "islamica")(twitter FALSE)(facebook TRUE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "persona13")(sexo h)(edad 19)(altura 174)(peso 58)(cuesta_hablar TRUE)(gusta_salir TRUE)(amigos 11)(religion "budista")(twitter TRUE)(facebook TRUE))
  
  (persona (nombre "persona14")(sexo m)(edad 32)(altura 165)(peso 59)(cuesta_hablar FALSE)(gusta_salir TRUE)(amigos 17)(religion "judia")(twitter FALSE)(facebook TRUE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "persona15")(sexo h)(edad 18)(altura 184)(peso 68)(cuesta_hablar TRUE)(gusta_salir FALSE)(amigos 5)(religion "judia")(twitter FALSE)(facebook TRUE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "persona16")(sexo m)(edad 58)(altura 189)(peso 73)(cuesta_hablar TRUE)(gusta_salir TRUE)(amigos 27)(religion "ninguna")(twitter TRUE)(facebook FALSE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "persona17")(sexo h)(edad 69)(altura 167)(peso 95)(cuesta_hablar TRUE)(gusta_salir TRUE)(amigos 1)(religion "catolica")(twitter FALSE)(facebook TRUE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "persona18")(sexo m)(edad 41)(altura 182)(peso 99)(cuesta_hablar TRUE)(gusta_salir FALSE)(amigos 29)(religion "budista")(twitter TRUE)(facebook TRUE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "persona19")(sexo h)(edad 30)(altura 163)(peso 59)(cuesta_hablar FALSE)(gusta_salir TRUE)(amigos 27)(religion "ninguna")(twitter FALSE)(facebook TRUE))
  
  (persona (nombre "persona20")(sexo m)(edad 30)(altura 191)(peso 68)(cuesta_hablar FALSE)(gusta_salir TRUE)(amigos 12)(religion "judia")(twitter TRUE)(facebook FALSE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "persona21")(sexo h)(edad 53)(altura 158)(peso 73)(cuesta_hablar TRUE)(gusta_salir TRUE)(amigos 25)(religion "catolica")(twitter FALSE)(facebook TRUE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "persona22")(sexo m)(edad 60)(altura 185)(peso 78)(cuesta_hablar FALSE)(gusta_salir FALSE)(amigos 4)(religion "islamica")(twitter FALSE)(facebook TRUE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "persona23")(sexo h)(edad 38)(altura 178)(peso 91)(cuesta_hablar FALSE)(gusta_salir FALSE)(amigos 8)(religion "catolica")(twitter TRUE)(facebook FALSE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "persona24")(sexo m)(edad 40)(altura 162)(peso 63)(cuesta_hablar TRUE)(gusta_salir FALSE)(amigos 29)(religion "judia")(twitter FALSE)(facebook TRUE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))

  (persona (nombre "persona25")(sexo h)(edad 27)(altura 194)(peso 78)(cuesta_hablar FALSE)(gusta_salir TRUE)(amigos 6)(religion "budista")(twitter FALSE)(facebook TRUE))
  
  (persona (nombre "persona26")(sexo m)(edad 36)(altura 156)(peso 57)(cuesta_hablar TRUE)(gusta_salir TRUE)(amigos 9)(religion "ninguna")(twitter FALSE)(facebook TRUE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "persona27")(sexo h)(edad 25)(altura 168)(peso 58)(cuesta_hablar FALSE)(gusta_salir TRUE)(amigos 24)(religion "catolica")(twitter FALSE)(facebook FALSE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "persona28")(sexo m)(edad 21)(altura 196)(peso 74)(cuesta_hablar FALSE)(gusta_salir FALSE)(amigos 24)(religion "budista")(twitter TRUE)(facebook FALSE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "persona29")(sexo h)(edad 84)(altura 154)(peso 62)(cuesta_hablar FALSE)(gusta_salir FALSE)(amigos 5)(religion "catolica")(twitter FALSE)(facebook TRUE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "persona30")(sexo m)(edad 54)(altura 167)(peso 68)(cuesta_hablar TRUE)(gusta_salir FALSE)(amigos 16)(religion "judia")(twitter TRUE)(facebook FALSE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "persona31")(sexo h)(edad 17)(altura 172)(peso 93)(cuesta_hablar FALSE)(gusta_salir TRUE)(amigos 13)(religion "islamica")(twitter FALSE)(facebook FALSE))
  
  (persona (nombre "persona32")(sexo m)(edad 24)(altura 162)(peso 52)(cuesta_hablar FALSE)(gusta_salir TRUE)(amigos 5)(religion "islamica")(twitter FALSE)(facebook FALSE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "persona33")(sexo h)(edad 42)(altura 179)(peso 52)(cuesta_hablar TRUE)(gusta_salir FALSE)(amigos 25)(religion "catolica")(twitter FALSE)(facebook TRUE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "persona34")(sexo m)(edad 43)(altura 178)(peso 68)(cuesta_hablar TRUE)(gusta_salir FALSE)(amigos 22)(religion "judia")(twitter FALSE)(facebook TRUE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "persona35")(sexo h)(edad 38)(altura 194)(peso 63)(cuesta_hablar FALSE)(gusta_salir FALSE)(amigos 32)(religion "catolica")(twitter TRUE)(facebook FALSE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "persona36")(sexo m)(edad 54)(altura 173)(peso 79)(cuesta_hablar FALSE)(gusta_salir TRUE)(amigos 27)(religion "islamica")(twitter TRUE)(facebook TRUE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "persona37")(sexo h)(edad 62)(altura 173)(peso 59)(cuesta_hablar TRUE)(gusta_salir TRUE)(amigos 23)(religion "judia")(twitter FALSE)(facebook FALSE))
  
  (persona (nombre "persona38")(sexo m)(edad 45)(altura 153)(peso 66)(cuesta_hablar FALSE)(gusta_salir TRUE)(amigos 12)(religion "islamica")(twitter TRUE)(facebook TRUE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "persona39")(sexo h)(edad 43)(altura 181)(peso 77)(cuesta_hablar TRUE)(gusta_salir FALSE)(amigos 16)(religion "catolica")(twitter FALSE)(facebook FALSE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
  (persona (nombre "persona40")(sexo m)(edad 50)(altura 165)(peso 68)(cuesta_hablar TRUE)(gusta_salir FALSE)(amigos 18)(religion "ninguna")(twitter TRUE)(facebook TRUE)(timido 0)(sociable 0)(muchos-amigos 0)(caracter 0))
  
 
)

(defglobal ?*crlf* = "
")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Modulo clasificar

(defmodule clasificar)

;Si a una persona le cuesta hablar con la gente entonces es t�mida.
(defrule timidez
  (declare (salience 100))
  ?persona <-(persona(cuesta_hablar ?c))
  =>
  (modify ?persona (timido ?c)) ;modificar el slot timidez con el valor de cuesta_hablar
)

;Una persona tiene muchos amigos si tiene m�s de veinte amigos
(defrule muchos-amigos
  (declare (salience 99))
  ?persona <-(persona(amigos ?a))
  =>
  (modify ?persona (muchos-amigos (> ?a 20)) )
)

;Si una persona tiene muchos amigos, est� en Tweeter y en Facebook entonces es muy sociable.
(defrule actitud-sociable
  (declare (salience 98))
  ?persona <-(persona(twitter ?tw)(facebook ?fc)(muchos-amigos ?m))
  =>
  (modify ?persona (sociable (and ?m (and ?tw ?fc))))
)

;Si a una persona le gusta salir y es muy sociable entonces es car�cter extrovertido.
(defrule caracter-extrovertido
  (declare (salience 97))
   ?persona <- (persona(gusta_salir ?gus&:(eq ?gus TRUE))(sociable ?soc&:(eq ?soc TRUE)))
   =>
   (modify ?persona (caracter extrovertido))
)

;Si una persona es t�mida y tiene pocos amigos entonces es car�cter introvertido.
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

(deffunction calc-afinidad (?nomb1 ?nomb2 ?peso1 ?peso2 ?alt1 ?alt2) 
  (bind ?af 0)

  ;si la diferencia de IMC entre la persona 1 y la persona 2 es menos que 5 sumamos 1 a la afinidad
  (bind ?imc1 (div ?peso1 (* ?alt1 ?alt1)))
  (bind ?imc2 (div ?peso2 (* ?alt2 ?alt2)))
  (if (<= (abs (- ?imc1 ?imc2)) 5) then
      ;(printout t  " imc 1" ?imc1 " ; imc2" ?imc2 crlf)
      (bind ?af (+ ?af 91))
  )  
   ;(printout t   ?nomb1 " y"  ?nomb2 "tienen una afinidad de " ?af crlf)
  (return ?af)
)

;Dos personas son compatibles si tienen distinto sexo, la misma religi�n y son ambas introvertidas, extrovertidas, o no clasificables.
(defrule compatibles1
	?p1 <- (persona(nombre ?nom1)(peso ?pes1)(sexo ?sex1 )(religion ?rel1 ) (caracter ?caract)(altura ?alt1))
	?p2 <- (persona(nombre ?nom2)(peso ?pes2)(sexo ?sex2 )(religion ?rel2 ) (caracter ?caract)(altura ?alt2))
  (test(or (eq ?caract inclasificable)(or (eq ?caract extrovertido)(eq ?caract introvertido))))
	(test(<> ?sex1 ?sex2))
	(test (= (str-compare ?rel1 ?rel2) 0))
	;solo se comprueban duplicados a la hora de hacer las citas
	=>
	(assert(compatibles(persona1 ?p1)(persona2 ?p2)(afinidad (calc-afinidad ?nom1 ?nom2 ?pes1 ?pes2 ?alt1 ?alt2))))
)
;Tambi�n consideramos compatibles a las que ambas son no-clasificables, tienen distinto sexo, distinta religi�n, y tienen muchos Amigos.
(defrule compatibles2
	?p1 <- (persona(nombre ?nom1)(peso ?pes1)(sexo ?sex1 )(religion ?rel1 )(muchos-amigos ?muc)(caracter ?caract)(altura ?alt1))
	?p2 <- (persona(nombre ?nom2)(peso ?pes2)(sexo ?sex2 )(religion ?rel2 )(muchos-amigos ?muc)(caracter ?caract)(altura ?alt2))
	(test(<> ?sex1 ?sex2))
	(test (<> (str-compare ?rel1 ?rel2) 0))
	(test (eq ?caract inclasificable))
	(test (eq ?muc TRUE))
	=>
	(assert(compatibles(persona1 ?p1)(persona2 ?p2)(afinidad (calc-afinidad ?nom1 ?nom2 ?pes1 ?pes2 ?alt1 ?alt2))))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Modulo citar
(defmodule citar)

(defrule cita-magica
  (declare (salience 100))
  ?p1<-(persona(nombre ?nom1)(edad ?eda1))
  ?p2<-(persona(nombre ?nom2)(edad ?eda2))
  (compatibles (persona1 ?p1)(persona2 ?p2)(afinidad ?afin&:(> ?afin 90)))
  ;S�lo se citan una vez a las mismas dos personas.
  (not (citados (persona1 ?p1)(persona2 ?p2)))
  (not (citados (persona1 ?p2)(persona2 ?p1)))
  ;S�lo una cita m�gica por persona
  (not (citados (persona1 ?p1)(tipo-cita ?tc&:(eq ?tc magica))))
  (not (citados (persona1 ?p2)(tipo-cita ?tc&:(eq ?tc magica))))
  (not (citados (persona2 ?p1)(tipo-cita ?tc&:(eq ?tc magica))))
  (not (citados (persona2 ?p2)(tipo-cita ?tc&:(eq ?tc magica))))
  =>
  (assert(citados(persona1 ?p1)(persona2 ?p2)(tipo-cita magica)))
  (printout t ?nom1 " y " ?nom2 " tienen una cita magica!!!!!!!!!" crlf)
)

;Se puede concertar una cita si dos personas son compatibles, siempre que su diferencia de edad sea menor de 10 a�os. S�lo se citan una vez a las mismas dos personas.
(defrule citar1
  (declare (salience 99))
	?p1<-(persona(nombre ?nom1)(edad ?eda1))
	?p2<-(persona(nombre ?nom2)(edad ?eda2))
	(compatibles (persona1 ?p1)(persona2 ?p2))
	(test (< (abs (- ?eda1 ?eda2)) 10))
  ;S�lo se citan una vez a las mismas dos personas.
	(not (citados (persona1 ?p1)(persona2 ?p2)))
  (not (citados (persona1 ?p2)(persona2 ?p1)))
	=>
	(assert(citados(persona1 ?p1)(persona2 ?p2)(tipo-cita normal)))
	(printout t ?nom1 " y " ?nom2 " estan citados" crlf)
)

;Tambi�n citamos a las personas compatibles con diferencia de edad mayor de 10 a�os si su edad est� por encima de los 50 a�os.
(defrule citar2
  (declare (salience 99))
	?p1<-(persona(nombre ?nom1)(edad ?eda1))
	?p2<-(persona(nombre ?nom2)(edad ?eda2))
	(compatibles (persona1 ?p1)(persona2 ?p2))
	(test (and (> ?eda1 50)(> ?eda2 50)))
	(test (> (abs (- ?eda1 ?eda2)) 10))
  ;S�lo se citan una vez a las mismas dos personas.
	(not (citados (persona1 ?p1)(persona2 ?p2)))
  (not (citados (persona1 ?p2)(persona2 ?p1)))
	=>
	(assert(citados(persona1 ?p1)(persona2 ?p2)(tipo-cita normal)))
	(printout t ?nom1 " y " ?nom2 " estan citados" crlf)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Modulo printear
(defmodule printear)

(defrule mostrar-template
	?persona <-(persona (nombre ?nom)(sexo ?sex)(edad ?eda)(altura ?alt)(peso ?pes)(cuesta_hablar ?cue)(gusta_salir ?gus)(amigos ?ami)(religion ?rel)(twitter ?twi)(facebook ?fac)(timido ?tim)(sociable ?soc)(muchos-amigos ?muc)(caracter ?car))
	=>
	;(printout t "[nombre "?nom ", sexo " ?sex ", edad " ?eda ", altura " ?alt ", peso "?pes ", cuesta_hablar " ?cue ", gusta_salir " ?gus ", num amigos " ?ami ", religion " ?rel ", twitter " ?twi ", facebook" ?fac ", timido "?tim ", sociable " ?soc ", muchos_amigos " ?muc ", caracter " ?car "]"  crlf)
)

(defrule mostrar-compatible1
	?p1<-(persona(nombre ?nom1))
	?p2<-(persona(nombre ?nom2))
	(compatibles (persona1 ?p1)(persona2 ?p2)(afinidad ?af))
	=>
	;(printout t ?nom1 " y " ?nom2 " son compatibles ^^" crlf)
  ;(printout t ?nom1 " y " ?nom2 " tienen una compatibilidad de " ?af crlf)
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
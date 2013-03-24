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
  (slot fumador(type SYMBOL))       ;bool: si es fumador o no
  (slot nuevas-exp(type SYMBOL))    ;bool: busca o no nuevas experiencias
  (slot responsable(type SYMBOL))   ;bool: es responsable o no
  (slot amable(type SYMBOL))        ;bool: si es amable o no
  (slot rel-estable(type SYMBOL))   ;bool: si busca una relación estable o no
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

  (persona (nombre "persona1")(sexo h)(edad 31)(altura 184)(peso 80)(cuesta_hablar FALSE)(gusta_salir TRUE)(amigos 10)(religion "ninguna")(twitter FALSE)(facebook TRUE)(fumador TRUE)(nuevas-exp FALSE)(responsable TRUE)(amable TRUE)(rel-estable TRUE))
  
  (persona (nombre "persona2")(sexo m)(edad 30)(altura 170)(peso 67)(cuesta_hablar FALSE)(gusta_salir TRUE)(amigos 12)(religion "judia")(twitter TRUE)(facebook TRUE)(fumador FALSE)(nuevas-exp TRUE)(responsable TRUE)(amable TRUE)(rel-estable FALSE))
  
  (persona (nombre "persona3")(sexo h)(edad 44)(altura 163)(peso 60)(cuesta_hablar TRUE)(gusta_salir FALSE)(amigos 9)(religion "catolica")(twitter TRUE)(facebook FALSE)(fumador TRUE)(nuevas-exp FALSE)(responsable TRUE)(amable FALSE)(rel-estable TRUE))
  
  (persona (nombre "persona4")(sexo m)(edad 24)(altura 154)(peso 64)(cuesta_hablar FALSE)(gusta_salir TRUE)(amigos 22)(religion "islamica")(twitter FALSE)(facebook TRUE)(fumador TRUE)(nuevas-exp FALSE)(responsable FALSE)(amable FALSE)(rel-estable TRUE))
  
  (persona (nombre "persona5")(sexo h)(edad 84)(altura 172)(peso 74)(cuesta_hablar TRUE)(gusta_salir FALSE)(amigos 13)(religion "catolica")(twitter FALSE)(facebook TRUE)(fumador FALSE)(nuevas-exp FALSE)(responsable TRUE)(amable TRUE)(rel-estable FALSE))
  
  (persona (nombre "persona6")(sexo m)(edad 54)(altura 187)(peso 86)(cuesta_hablar TRUE)(gusta_salir FALSE)(amigos 4)(religion "judia")(twitter TRUE)(facebook FALSE)(fumador FALSE)(nuevas-exp TRUE)(responsable TRUE)(amable TRUE)(rel-estable TRUE))
  
  (persona (nombre "persona7")(sexo h)(edad 45)(altura 190)(peso 57)(cuesta_hablar TRUE)(gusta_salir TRUE)(amigos 7)(religion "budista")(twitter FALSE)(facebook TRUE)(fumador TRUE)(nuevas-exp TRUE)(responsable FALSE)(amable FALSE)(rel-estable FALSE))
  
  (persona (nombre "persona8")(sexo m)(edad 51)(altura 157)(peso 94)(cuesta_hablar FALSE)(gusta_salir TRUE)(amigos 16)(religion "judia")(twitter FALSE)(facebook TRUE)(fumador TRUE)(nuevas-exp FALSE)(responsable FALSE)(amable FALSE)(rel-estable FALSE))
  
  (persona (nombre "persona9")(sexo h)(edad 26)(altura 200)(peso 73)(cuesta_hablar FALSE)(gusta_salir FALSE)(amigos 26)(religion "catolica")(twitter FALSE)(facebook FALSE)(fumador TRUE)(nuevas-exp TRUE)(responsable FALSE)(amable FALSE)(rel-estable TRUE))
  
  (persona (nombre "persona10")(sexo m)(edad 72)(altura 175)(peso 74)(cuesta_hablar TRUE)(gusta_salir TRUE)(amigos 5)(religion "ninguna")(twitter TRUE)(facebook TRUE)(fumador TRUE)(nuevas-exp TRUE)(responsable TRUE)(amable TRUE)(rel-estable FALSE))
  
  (persona (nombre "persona11")(sexo h)(edad 65)(altura 175)(peso 63)(cuesta_hablar FALSE)(gusta_salir FALSE)(amigos 26)(religion "catolica")(twitter TRUE)(facebook FALSE)(fumador FALSE)(nuevas-exp FALSE)(responsable TRUE)(amable FALSE)(rel-estable TRUE))
  
  (persona (nombre "persona12")(sexo m)(edad 54)(altura 163)(peso 81)(cuesta_hablar FALSE)(gusta_salir FALSE)(amigos 23)(religion "islamica")(twitter FALSE)(facebook TRUE)(fumador FALSE)(nuevas-exp FALSE)(responsable TRUE)(amable TRUE)(rel-estable TRUE))
  
  (persona (nombre "persona13")(sexo h)(edad 19)(altura 174)(peso 58)(cuesta_hablar TRUE)(gusta_salir TRUE)(amigos 11)(religion "budista")(twitter TRUE)(facebook TRUE)(fumador TRUE)(nuevas-exp TRUE)(responsable FALSE)(amable FALSE)(rel-estable FALSE))
  
  (persona (nombre "persona14")(sexo m)(edad 32)(altura 165)(peso 59)(cuesta_hablar FALSE)(gusta_salir TRUE)(amigos 17)(religion "judia")(twitter FALSE)(facebook TRUE)(fumador FALSE)(nuevas-exp TRUE)(responsable FALSE)(amable TRUE)(rel-estable TRUE))
  
  (persona (nombre "persona15")(sexo h)(edad 18)(altura 184)(peso 68)(cuesta_hablar TRUE)(gusta_salir FALSE)(amigos 5)(religion "judia")(twitter FALSE)(facebook TRUE)(fumador TRUE)(nuevas-exp FALSE)(responsable TRUE)(amable TRUE)(rel-estable TRUE))
  
  (persona (nombre "persona16")(sexo m)(edad 58)(altura 189)(peso 73)(cuesta_hablar TRUE)(gusta_salir TRUE)(amigos 27)(religion "ninguna")(twitter TRUE)(facebook FALSE)(fumador FALSE)(nuevas-exp FALSE)(responsable FALSE)(amable FALSE)(rel-estable FALSE))
  
  (persona (nombre "persona17")(sexo h)(edad 69)(altura 167)(peso 95)(cuesta_hablar TRUE)(gusta_salir TRUE)(amigos 1)(religion "catolica")(twitter FALSE)(facebook TRUE)(fumador TRUE)(nuevas-exp TRUE)(responsable TRUE)(amable FALSE)(rel-estable TRUE))
  
  (persona (nombre "persona18")(sexo m)(edad 41)(altura 182)(peso 99)(cuesta_hablar TRUE)(gusta_salir FALSE)(amigos 29)(religion "budista")(twitter TRUE)(facebook TRUE)(fumador FALSE)(nuevas-exp FALSE)(responsable FALSE)(amable TRUE)(rel-estable TRUE))
  
  (persona (nombre "persona19")(sexo h)(edad 30)(altura 163)(peso 59)(cuesta_hablar FALSE)(gusta_salir TRUE)(amigos 27)(religion "ninguna")(twitter FALSE)(facebook TRUE)(fumador FALSE)(nuevas-exp FALSE)(responsable TRUE)(amable FALSE)(rel-estable TRUE))
  
  (persona (nombre "persona20")(sexo m)(edad 30)(altura 191)(peso 68)(cuesta_hablar FALSE)(gusta_salir TRUE)(amigos 12)(religion "judia")(twitter TRUE)(facebook FALSE)(fumador TRUE)(nuevas-exp TRUE)(responsable FALSE)(amable TRUE)(rel-estable TRUE))
  
  (persona (nombre "persona21")(sexo h)(edad 53)(altura 158)(peso 73)(cuesta_hablar TRUE)(gusta_salir TRUE)(amigos 25)(religion "catolica")(twitter FALSE)(facebook TRUE)(fumador FALSE)(nuevas-exp TRUE)(responsable TRUE)(amable FALSE)(rel-estable FALSE))
  
  (persona (nombre "persona22")(sexo m)(edad 60)(altura 185)(peso 78)(cuesta_hablar FALSE)(gusta_salir FALSE)(amigos 4)(religion "islamica")(twitter FALSE)(facebook TRUE)(fumador FALSE)(nuevas-exp TRUE)(responsable TRUE)(amable FALSE)(rel-estable FALSE))
  
  (persona (nombre "persona23")(sexo h)(edad 38)(altura 178)(peso 91)(cuesta_hablar FALSE)(gusta_salir FALSE)(amigos 8)(religion "catolica")(twitter TRUE)(facebook FALSE)(fumador TRUE)(nuevas-exp TRUE)(responsable TRUE)(amable TRUE)(rel-estable TRUE))
  
  (persona (nombre "persona24")(sexo m)(edad 40)(altura 162)(peso 63)(cuesta_hablar TRUE)(gusta_salir FALSE)(amigos 29)(religion "judia")(twitter FALSE)(facebook TRUE)(fumador FALSE)(nuevas-exp FALSE)(responsable TRUE)(amable FALSE)(rel-estable FALSE))

  (persona (nombre "persona25")(sexo h)(edad 27)(altura 194)(peso 78)(cuesta_hablar FALSE)(gusta_salir TRUE)(amigos 6)(religion "budista")(twitter FALSE)(facebook TRUE)(fumador FALSE)(nuevas-exp FALSE)(responsable TRUE)(amable TRUE)(rel-estable TRUE))
  
  (persona (nombre "persona26")(sexo m)(edad 36)(altura 156)(peso 57)(cuesta_hablar TRUE)(gusta_salir TRUE)(amigos 9)(religion "ninguna")(twitter FALSE)(facebook TRUE)(fumador TRUE)(nuevas-exp TRUE)(responsable FALSE)(amable FALSE)(rel-estable TRUE))
  
  (persona (nombre "persona27")(sexo h)(edad 25)(altura 168)(peso 58)(cuesta_hablar FALSE)(gusta_salir TRUE)(amigos 24)(religion "catolica")(twitter FALSE)(facebook FALSE)(fumador FALSE)(nuevas-exp TRUE)(responsable FALSE)(amable TRUE)(rel-estable TRUE))
  
  (persona (nombre "persona28")(sexo m)(edad 21)(altura 196)(peso 74)(cuesta_hablar FALSE)(gusta_salir FALSE)(amigos 24)(religion "budista")(twitter TRUE)(facebook FALSE)(fumador FALSE)(nuevas-exp FALSE)(responsable FALSE)(amable FALSE)(rel-estable FALSE))
  
  (persona (nombre "persona29")(sexo h)(edad 84)(altura 154)(peso 62)(cuesta_hablar FALSE)(gusta_salir FALSE)(amigos 5)(religion "catolica")(twitter FALSE)(facebook TRUE)(fumador TRUE)(nuevas-exp TRUE)(responsable TRUE)(amable FALSE)(rel-estable FALSE))
  
  (persona (nombre "persona30")(sexo m)(edad 54)(altura 167)(peso 68)(cuesta_hablar TRUE)(gusta_salir FALSE)(amigos 16)(religion "judia")(twitter TRUE)(facebook FALSE)(fumador FALSE)(nuevas-exp FALSE)(responsable FALSE)(amable FALSE)(rel-estable FALSE))
  
  (persona (nombre "persona31")(sexo h)(edad 17)(altura 172)(peso 93)(cuesta_hablar FALSE)(gusta_salir TRUE)(amigos 13)(religion "islamica")(twitter FALSE)(facebook FALSE)(fumador FALSE)(nuevas-exp TRUE)(responsable TRUE)(amable FALSE)(rel-estable TRUE))
  
  (persona (nombre "persona32")(sexo m)(edad 24)(altura 162)(peso 52)(cuesta_hablar FALSE)(gusta_salir TRUE)(amigos 5)(religion "islamica")(twitter FALSE)(facebook FALSE)(fumador FALSE)(nuevas-exp TRUE)(responsable FALSE)(amable FALSE)(rel-estable FALSE))
  
  (persona (nombre "persona33")(sexo h)(edad 42)(altura 179)(peso 52)(cuesta_hablar TRUE)(gusta_salir FALSE)(amigos 25)(religion "catolica")(twitter FALSE)(facebook TRUE)(fumador TRUE)(nuevas-exp TRUE)(responsable TRUE)(amable TRUE)(rel-estable FALSE))
  
  (persona (nombre "persona34")(sexo m)(edad 43)(altura 178)(peso 68)(cuesta_hablar TRUE)(gusta_salir FALSE)(amigos 22)(religion "judia")(twitter FALSE)(facebook TRUE)(fumador TRUE)(nuevas-exp FALSE)(responsable FALSE)(amable TRUE)(rel-estable TRUE))
  
  (persona (nombre "persona35")(sexo h)(edad 38)(altura 194)(peso 63)(cuesta_hablar FALSE)(gusta_salir FALSE)(amigos 32)(religion "catolica")(twitter TRUE)(facebook FALSE)(fumador FALSE)(nuevas-exp TRUE)(responsable FALSE)(amable TRUE)(rel-estable TRUE))
  
  (persona (nombre "persona36")(sexo m)(edad 54)(altura 173)(peso 79)(cuesta_hablar FALSE)(gusta_salir TRUE)(amigos 27)(religion "islamica")(twitter TRUE)(facebook TRUE)(fumador FALSE)(nuevas-exp FALSE)(responsable TRUE)(amable FALSE)(rel-estable FALSE))
  
  (persona (nombre "persona37")(sexo h)(edad 62)(altura 173)(peso 59)(cuesta_hablar TRUE)(gusta_salir TRUE)(amigos 23)(religion "judia")(twitter FALSE)(facebook FALSE)(fumador TRUE)(nuevas-exp TRUE)(responsable FALSE)(amable TRUE)(rel-estable TRUE))
  
  (persona (nombre "persona38")(sexo m)(edad 45)(altura 153)(peso 66)(cuesta_hablar FALSE)(gusta_salir TRUE)(amigos 12)(religion "islamica")(twitter TRUE)(facebook TRUE)(fumador FALSE)(nuevas-exp FALSE)(responsable FALSE)(amable FALSE)(rel-estable TRUE))
  
  (persona (nombre "persona39")(sexo h)(edad 43)(altura 181)(peso 77)(cuesta_hablar TRUE)(gusta_salir FALSE)(amigos 16)(religion "catolica")(twitter FALSE)(facebook FALSE)(fumador FALSE)(nuevas-exp TRUE)(responsable FALSE)(amable TRUE)(rel-estable TRUE))
  
  (persona (nombre "persona40")(sexo m)(edad 50)(altura 165)(peso 68)(cuesta_hablar TRUE)(gusta_salir FALSE)(amigos 18)(religion "ninguna")(twitter TRUE)(facebook TRUE)(fumador TRUE)(nuevas-exp FALSE)(responsable FALSE)(amable TRUE)(rel-estable FALSE))
  
  
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

;mismos objetivos: apertura a nuevas experiencias, responsabilidad, amabilidad y estabilidad emocional
;fuente: http://www.muyinteresante.es/innovacion/sociedad/articulo/test-de-compatibilidad-para-encontrar-tu-pareja-ideal
(deffunction afinidad-objetivos (?nuevas1 ?nuevas2 ?resp1 ?resp2 ?amab1 ?amab2 ?est1 ?est2)
  (bind ?af 0)
  (if (eq ?nuevas1 ?nuevas2)  then
    (bind ?af (+ ?af 1))
  )
  (if (eq ?resp1 ?resp2)  then
    (bind ?af (+ ?af 1))
  )
  (if (eq ?amab1 ?amab2)  then
    (bind ?af (+ ?af 1))
  )
  (if (eq ?est1 ?est2)  then
    (bind ?af (+ ?af 1))
  )
  (return ?af)
)

;si la diferencia de IMC entre la persona 1 y la persona 2 es menor que 5
;fuentes: http://es.wikipedia.org/wiki/Canon_de_belleza 
; http://es.wikipedia.org/wiki/%C3%8Dndice_de_masa_corporal
(deffunction afinidad-imc (?pes1 ?pes2 ?alt1 ?alt2)
  (bind ?altm1 (/ ?alt1 100)); altura1 en metros
  (bind ?altm2 (/ ?alt2 100)); altura2 en metros
  (bind ?imc1 (/ ?pes1 (* ?altm1 ?altm1)))
  (bind ?imc2 (/ ?pes2 (* ?altm2 ?altm2)))
  (if (<= (abs (- ?imc1 ?imc2)) 5) then
        (return 0.5)
   else (return 0)
  ) 
)

;si ambos son fumadores o ambos no fumadores
;fuente: http://www.edarling.es/consejos/familia/mis-hijos-no-aceptan-a-mi-pareja
(deffunction afinidad-fum (?fum1 ?fum2)
  (if (eq ?fum1 ?fum2) then
        (return 0.5)
   else (return 0)
  )
)

;calculo del grado de afinidad, con un grado de afinidad mayor que 70 se establecen citas mágicas 
(deffunction calc-afinidad (?p1 ?p2)
  ;grado de afinidad imc entre [0-1] * 20=> (0% - 20%)
  (bind ?a1 (* 20 (afinidad-imc ?pes1 ?pes2 ?alt1 ?alt2)))
  ;grado de afinidad fumadores entre [0-1] * 20 => (0% - 20%)
  (bind ?a2 (* 20 (afinidad-fum ?fum1 ?fum2))) 
  ;grado de afinidad por objetivos entre [0-4] * 20=> (0% - 60%)
  (bind ?a3 (* 20 (afinidad-objetivos ?nuevas1 ?nuevas2 ?resp1 ?resp2 ?amab1 ?amab2 ?est1 ?est2)))
  ;grado de afinidad total (0% - 100%)
  (bind ?afin (+ ?a1 (+ ?a2 ?a3)))
  ;;(printout t ?nom1 " y " ?nom2 " tienen grado de afinidad: " ?afin crlf)
  (return ?afin)
)

;Dos personas son compatibles si tienen distinto sexo, la misma religión y son ambas introvertidas, extrovertidas, o no clasificables.
(defrule compatibles1

  ?p1 <- (persona (nombre ?nom1)(sexo ?sex1)(edad ?eda1)(altura ?alt1)(peso ?pes1)(cuesta_hablar ?cue1)
                  (gusta_salir ?gus1)(amigos ?ami1)(religion ?rel1)(twitter ?twi1)(facebook ?fac1)
                  (timido ?tim1)(sociable ?soc1)(muchos-amigos ?muc1)(caracter ?caract)(fumador ?fum1)
                  (nuevas-exp ?nuevas1)(responsable ?resp1)(amable ?amab1)(rel-estable ?est1))

  ?p2 <- (persona (nombre ?nom2)(sexo ?sex2)(edad ?eda2)(altura ?alt2)(peso ?pes2)(cuesta_hablar ?cue2)
                  (gusta_salir ?gus2)(amigos ?ami2)(religion ?rel2)(twitter ?twi2)(facebook ?fac2)
                  (timido ?tim2)(sociable ?soc2)(muchos-amigos ?muc2)(caracter ?caract)(fumador ?fum2)
                  (nuevas-exp ?nuevas2)(responsable ?resp2)(amable ?amab2)(rel-estable ?est2))

  (test(or (eq ?caract inclasificable)(or (eq ?caract extrovertido)(eq ?caract introvertido))))
	(test(<> ?sex1 ?sex2))
	(test (= (str-compare ?rel1 ?rel2) 0))
	;solo se comprueban duplicados a la hora de hacer las citas
	=>
	(assert(compatibles(persona1 ?p1)(persona2 ?p2)(afinidad (calc-afinidad ?p1 ?p2))))
)

;También consideramos compatibles a las que ambas son no-clasificables, tienen distinto sexo, distinta religión, y tienen muchos Amigos.
(defrule compatibles2

  ?p1 <- (persona (nombre ?nom1)(sexo ?sex1)(edad ?eda1)(altura ?alt1)(peso ?pes1)(cuesta_hablar ?cue1)
                  (gusta_salir ?gus1)(amigos ?ami1)(religion ?rel1)(twitter ?twi1)(facebook ?fac1)
                  (timido ?tim1)(sociable ?soc1)(muchos-amigos ?muc)(caracter ?caract)(fumador ?fum1)
                  (nuevas-exp ?nuevas1)(responsable ?resp1)(amable ?amab1)(rel-estable ?est1))

  ?p2 <- (persona (nombre ?nom2)(sexo ?sex2)(edad ?eda2)(altura ?alt2)(peso ?pes2)(cuesta_hablar ?cue2)
                  (gusta_salir ?gus2)(amigos ?ami2)(religion ?rel2)(twitter ?twi2)(facebook ?fac2)
                  (timido ?tim2)(sociable ?soc2)(muchos-amigos ?muc)(caracter ?caract)(fumador ?fum2)
                  (nuevas-exp ?nuevas2)(responsable ?resp2)(amable ?amab2)(rel-estable ?est2))

	(test (<> ?sex1 ?sex2))
	(test (<> (str-compare ?rel1 ?rel2) 0))
	(test (eq ?caract inclasificable))
	(test (eq ?muc TRUE))
	=>
	(assert(compatibles(persona1 ?p1)(persona2 ?p2)(afinidad (calc-afinidad ?p1 ?p2))))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Modulo citar
(defmodule citar)

(defrule cita-magica
  (declare (salience 100))
  ?p1<-(persona(nombre ?nom1)(edad ?eda1))
  ?p2<-(persona(nombre ?nom2)(edad ?eda2))
  ;Se establecen citas mágicas con un grado de afinidad mayor que 70
  (compatibles (persona1 ?p1)(persona2 ?p2)(afinidad ?afin&:(>= ?afin 70)))
  ;Sólo se citan una vez a las mismas dos personas.
  (not (citados (persona1 ?p1)(persona2 ?p2)))
  (not (citados (persona1 ?p2)(persona2 ?p1)))
  ;Sólo una cita mágica por persona
  (not (citados (persona1 ?p1)(tipo-cita ?tc&:(eq ?tc magica))))
  (not (citados (persona1 ?p2)(tipo-cita ?tc&:(eq ?tc magica))))
  (not (citados (persona2 ?p1)(tipo-cita ?tc&:(eq ?tc magica))))
  (not (citados (persona2 ?p2)(tipo-cita ?tc&:(eq ?tc magica))))
  =>
  (assert(citados(persona1 ?p1)(persona2 ?p2)(tipo-cita magica)))
  ;(printout t ?nom1 " y " ?nom2 " tienen una cita magica!!!!!!!!!" crlf)
)

;Se puede concertar una cita si dos personas son compatibles, siempre que su diferencia de edad sea menor de 10 años. Sólo se citan una vez a las mismas dos personas.
(defrule citar1
  (declare (salience 99))
	?p1<-(persona(nombre ?nom1)(edad ?eda1))
	?p2<-(persona(nombre ?nom2)(edad ?eda2))
	(compatibles (persona1 ?p1)(persona2 ?p2))
	(test (< (abs (- ?eda1 ?eda2)) 10))
  ;Sólo se citan una vez a las mismas dos personas.
	(not (citados (persona1 ?p1)(persona2 ?p2)))
  (not (citados (persona1 ?p2)(persona2 ?p1)))
	=>
	(assert(citados(persona1 ?p1)(persona2 ?p2)(tipo-cita normal)))
	;(printout t ?nom1 " y " ?nom2 " estan citados" crlf)
)

;También citamos a las personas compatibles con diferencia de edad mayor de 10 años si su edad está por encima de los 50 años.
(defrule citar2
  (declare (salience 99))
	?p1<-(persona(nombre ?nom1)(edad ?eda1))
	?p2<-(persona(nombre ?nom2)(edad ?eda2))
	(compatibles (persona1 ?p1)(persona2 ?p2))
	(test (and (> ?eda1 50)(> ?eda2 50)))
	(test (> (abs (- ?eda1 ?eda2)) 10))
  ;Sólo se citan una vez a las mismas dos personas.
	(not (citados (persona1 ?p1)(persona2 ?p2)))
  (not (citados (persona1 ?p2)(persona2 ?p1)))
	=>
	(assert(citados(persona1 ?p1)(persona2 ?p2)(tipo-cita normal)))
	;(printout t ?nom1 " y " ?nom2 " estan citados" crlf)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Modulo mostrar
(defmodule mostrar)

(defrule mostrar-template
	?persona <-(persona (nombre ?nom)(sexo ?sex)(edad ?eda)(altura ?alt)(peso ?pes)(cuesta_hablar ?cue)(gusta_salir ?gus)(amigos ?ami)(religion ?rel)(twitter ?twi)(facebook ?fac)(timido ?tim)(sociable ?soc)(muchos-amigos ?muc)(caracter ?car))
	=>
	;;(printout t "[nombre "?nom ", sexo " ?sex ", edad " ?eda ", altura " ?alt ", peso "?pes ", cuesta_hablar " ?cue ", gusta_salir " ?gus ", num amigos " ?ami ", religion " ?rel ", twitter " ?twi ", facebook" ?fac ", timido "?tim ", sociable " ?soc ", muchos_amigos " ?muc ", caracter " ?car "]"  crlf)
)

(defrule mostrar-compatible1
	?p1<-(persona(nombre ?nom1))
	?p2<-(persona(nombre ?nom2))
	(compatibles (persona1 ?p1)(persona2 ?p2)(afinidad ?af))
	=>
	;;(printout t ?nom1 " y " ?nom2 " son compatibles ^^" crlf)
  ;;(printout t ?nom1 " y " ?nom2 " tienen una compatibilidad de " ?af crlf)
)

(defrule mostrar-citas
  ?p1<-(persona(nombre ?nom1))
  ?p2<-(persona(nombre ?nom2))
  (citados (persona1 ?p1)(persona2 ?p2)(tipo-cita ?tc))
  =>
  (printout t ?nom1 " y " ?nom2 " tienen una cita " ?tc crlf)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Programa

(deffunction run-system ()
  (reset)
  (focus clasificar compatibilizar citar mostrar)
  (run)
)

;(while TRUE
  (run-system);)
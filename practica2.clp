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
  (slot religion) ; religiones enum
  (slot twitter) ; bool
  (slot facebook) ; bool
)

(deffacts participantes
	(persona (nombre "arturo")(sexo "h")(edad 24)(altura 173)(peso 73)(cuesta_hablar si)(gusta_salir si)(amigos 21)(religion "ninguna")(twitter si)(facebook si))
  (persona (nombre "alguien")(sexo "h")(edad 24)(altura 173)(peso 73)(cuesta_hablar si)(gusta_salir no)(amigos 10)(religion "ninguna")(twitter si)(facebook si))
)

(defglobal ?*crlf* = "
")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Modulo clasificar

(defmodule clasificar)

;una persona es timida si le cuesta hablar
(defrule timidez
  ?persona <-(persona(nombre ?n)(cuesta_hablar ?c&:(= ?c si)))
  =>
  (assert(timida ?persona))
  (printout t " Eres timido " ?n "." crlf)
)

(defrule muchos-amigos
  ?persona <-(persona(nombre ?n)(amigos ?a&:(> ?a 20)))
  =>
  (assert(muchos-amigos ?persona))
  (printout t "Tienes muchos amigos " ?n "." crlf)
)

(defrule pocos-amigos
  ?persona <-(persona(nombre ?n)(amigos ?a&:(< ?a 21)))
  =>
  (assert(pocos-amigos ?persona))
  (printout t "Tienes pocos amigos " ?n "." crlf)
)

;muchos amigos, twitter y facebook => sociable
(defrule actitud-sociable
  ?persona <-(persona(nombre ?n)(twitter ?tw&:(= ?tw si))(facebook ?fc&:(= ?fc si)))
  (muchos-amigos ?persona)
  =>
  (assert(sociable ?persona))
  (printout t "Eres sociable " ?n "." crlf)
)

;le gusta salir, es sociable => extrovertido
(defrule caracter-extrovertido
  ?persona <-(persona(nombre ?n)(gusta_salir ?g&:(= ?g si)))
  (sociable ?persona)
  =>
  (assert(extrovertida ?persona))
  (printout t "Eres extrovertido " ?n "." crlf)
)

;timida, pocos amigos => introvertido
(defrule caracter-introvertido
  ?persona <-(persona(nombre ?n)) ;no hace falta
  (timida ?persona)
  (pocos-amigos ?persona)
  =>
  (assert(introvertida ?persona))
  (printout t "Eres introvertido " ?n "." crlf)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Programa

(deffunction run-system ()
  (reset)
  (focus clasificar)
  (run)
  (facts)
)

;(while TRUE
  (run-system);)
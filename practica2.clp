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
	(persona (nombre "arturo")(sexo "h")(edad 24)(altura 173)(peso 73)(cuesta_hablar si)(gusta_salir no)(amigos 10)(religion ninguna)(twitter si)(facebook si))
)

(defglobal ?*crlf* = "
")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Modulo clasificar

(defmodule clasificar)

(defrule print-banner
  =>
  (printout t "Type your name and press Enter> ")
  (bind ?name (read))
  (printout t crlf "**********************************" crlf)
  (printout t " Hello, " ?name "." crlf)
  (printout t " Welcome to the tax forms advisor" crlf)
  (printout t " Please answer the questions and" crlf)
  (printout t " I will tell you what tax forms" crlf)
  (printout t " you may need to file." crlf)
  (printout t "**********************************" crlf crlf))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Programa

(deffunction run-system ()
  (reset)
  (focus clasificar)
  (run)
  (watch all))

(while TRUE
  (run-system))
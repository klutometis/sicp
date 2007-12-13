;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "and-gate.scm")
(load "probe.scm")
(load "make-wire.scm")
(load "propagate.scm")
(load "set-signal!.scm")
(load "the-agenda.scm")

(define a1 (make-wire))
(define a2 (make-wire))
(define output (make-wire))

(probe 'a1 a1)
(probe 'a2 a2)
(probe 'output output)

(inverter-adder a1 a2 output)

;; Simulate FIFO:
(set-signal! a1 1)
(set-signal! a1 0)
(set-signal! a2 1)
(set-signal! a2 0)
(propagate)

;; Simulate LIFO:
(set-signal! a2 0)
(set-signal! a2 1)
(set-signal! a1 0)
(set-signal! a1 1)
(propagate)

;; In a LIFO system, a1 and a2 would change from 1,0 to 0,1; thus, the
;; and-gate results in 1, not 0 (as in FIFO).

;; FIFO simulates the flow of electricity forward in time.

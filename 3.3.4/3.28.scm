;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "or-gate.scm")
(load "make-wire.scm")
(load "probe.scm")
(load "set-signal!.scm")
(load "propagate.scm")
(load "the-agenda.scm")

(define input-1 (make-wire))
(define input-2 (make-wire))
(define output (make-wire))

(probe 'output output)

(or-gate input-1 input-2 output)

(set-signal! input-1 0)
(set-signal! input-2 0)
(propagate)

(set-signal! input-1 1)
(propagate)

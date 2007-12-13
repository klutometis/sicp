;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "half-adder.scm")
(load "make-wire.scm")
(load "probe.scm")
(load "set-signal!.scm")
(load "propagate.scm")
(load "the-agenda.scm")

(define input-1 (make-wire))
(define input-2 (make-wire))
(define sum (make-wire))
(define carry (make-wire))

(probe 'sum sum)
(probe 'carry carry)

(half-adder input-1 input-2 sum carry)

(set-signal! input-1 1)
(propagate)

(set-signal! input-2 1)
(propagate)

;; The procedures are called immediatel to inaugurate their delay;
;; otherwise, the delay would not be initiated until the next
;; propagation.

;; In particular, probing and carry are activated only upon the
;; propagation two; sum, the third propagation.

(load "ripple-carry-adder.scm")
(load "make-wire.scm")
(load "probe.scm")
(load "set-signal!.scm")
(load "propagate.scm")
(load "the-agenda.scm")

(define a* (list (make-wire) (make-wire)))
(define b* (list (make-wire) (make-wire)))
(define s* (list (make-wire) (make-wire)))
(define c (make-wire))

(define sum 0)
(map (lambda (s)
       (set! sum (+ sum 1))
       (probe (string-append "s" (number->string sum)) s)) s*)

(ripple-carry-adder a* b* s* c)

;; 11 + 10 = 101
(set-signal! (car a*) 1)
(set-signal! (cadr a*) 1)
(set-signal! (cadr b*) 1)
(propagate)

;; Needs (* n (+ (* 2 half-adder-delay) or-gate-delay)), or
;; (* n (+ (* 2 (+ (* 2 and-gate-delay) or-gate-delay inverter-delay) or-gate-delay)).

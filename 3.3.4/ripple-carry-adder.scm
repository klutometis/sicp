;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "full-adder.scm")
(load "make-wire.scm")
(load "probe.scm")

(load-option 'format)
(define (ripple-carry-adder a* b* s* c)
  (define (chain-adders a* b* c-in s* c-out)
    (cond ((null? a*) 'ok)
          (else
           (let ((a (car a*))
                 (b (car b*))
                 (s (car s*)))
             (probe 'c-out c-out)
             (full-adder a b c-in s c-out))
           (chain-adders (cdr a*)
                         (cdr b*)
                         c-out
                         (cdr s*)
                         (make-wire)))))
  (chain-adders a* b* c s* (make-wire)))

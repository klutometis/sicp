;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "stream-car.scm")
(load "stream-cdr.scm")

(define (stream-ref s n)
  (if (zero? n)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))

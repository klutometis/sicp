;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "cont-frac.scm")

(define (tan-cf x k)
  (cont-frac (lambda (i)
               (if (zero? i)
                   x
                   (square x)))
             (lambda (i) (+ (* 2 i) 1))
             k))

(tan 1)
(tan-cf 1 100)

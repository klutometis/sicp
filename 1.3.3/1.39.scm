;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../1.3.3/section)
(require '../util/util)
(import* util approx? square)
(import* section-1.3.3 cont-frac)

(define (tan-cf x k)
  (cont-frac (lambda (i)
               (if (zero? i)
                   x
                   (- (square x))))
             (lambda (i) (+ (* 2 i) 1))
             k))

(check (tan 1) (=> approx?) (tan-cf 1 100))

;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../1.3.3/section)
(require '../util/util)
(import* section-1.3.3 cont-frac)
(import* util approx?)

(define (euler-e k)
  (define (n i) 1.0)
  (define (d i)
    (let ((j (- i 1)))
      (if (zero? (modulo j 3))
          (+ (* 2 (/ j 3)) 2)
          1)))
  (+ (cont-frac n d k) 2))

(check (euler-e 100) (=> approx?) (exp 1))

;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../1.3.4/section)
(require '../util/util)
(import* util approx?)
(import* section-1.3.4 repeated)

(define dx 0.00001)
(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(check ((smooth sin) 1.0) (=> approx?) (sin 1))

(define (n-fold-smooth f n)
  (lambda (x) ((repeated (smooth f) n) x)))

(check ((n-fold-smooth sin 4) 1.0)
       (=> approx?) ((repeated sin 4) 1))

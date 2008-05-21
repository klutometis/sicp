;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension check)
(require '../util/util)
(import* util cube square approx?)

(define (cbrt x)
  (define (good-enough? guess)
    (< (abs (- (cube guess) x)) 0.001))

  (define (approximate-cube x y)
    (/ (+ (/ x (square y)) (* 2 y)) 3 ))

  (define (improve guess)
    (approximate-cube x guess))

  (define (cbrt-iter guess)
    (if (good-enough? guess)
        guess
        (cbrt-iter (improve guess))))
  
  (cbrt-iter 1.0))

(check (cbrt 27) (=> approx?) 3)

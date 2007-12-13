;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (cbrt x)
  (define (square x) (* x x))

  (define (cube x) (* x x x))

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
  
  (cbrt-iter 1.0)
  )

(cbrt 27)

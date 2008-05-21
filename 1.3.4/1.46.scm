;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../1.3.4/section)
(require '../util/util)
(import* util square approx?)
(import* section-1.3.4 average-damp)

(define (iterative-improve good-enough? improve)
  (define (iter guess)
    (if (good-enough? guess)
        guess
        (iter (improve guess))))
  iter)

(define tolerance 0.00001)

(define (close-enough? a b)
  (< (abs (- a b)) tolerance))

(define (sqrt x)
  ((iterative-improve
    (lambda (guess)
      (close-enough? (square guess) x))
    (lambda (guess) (/ (+ guess (/ x guess)) 2)))
   1.0))

(define (fixed-point f incipient-guess)
  ((iterative-improve
    (lambda (guess)
      (close-enough? (f guess) guess))
    (lambda (guess) (f guess)))
   incipient-guess))

(check (sqrt 4) (=> approx?) 2.0)

;;; Page 69
(check (fixed-point cos 1.0) (=> approx?) 0.73908)

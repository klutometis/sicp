(load "average-damp.scm")

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
;;      (write-line guess)
      (close-enough? (square guess) x))
    (lambda (guess) (/ (+ guess (/ x guess)) 2)))
   1.0))

(sqrt 4)

(define (fixed-point f incipient-guess)
  ((iterative-improve
    (lambda (guess)
      (close-enough? (f guess) guess))
    (lambda (guess) (f guess)))
   incipient-guess))

(break close-enough?)
(fixed-point cos 1.0)

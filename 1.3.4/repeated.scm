(load "compose.scm")

(define (repeated f n)
  (cond ((< n 1) (lambda (x) x))
        ((= n 1) (lambda (x) (f x)))
        (else (compose f (repeated f (- n 1))))))

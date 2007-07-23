(load "prime.scm")

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

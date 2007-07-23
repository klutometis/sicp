(load "rand.scm")

(define (cesaro-test)
  (= (gcd (rand) (rand)) 1))

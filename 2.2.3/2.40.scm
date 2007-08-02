(load "unique-pairs.scm")
(load "prime-sum.scm")
(load "make-pair-sum.scm")

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (unique-pairs n))))

(prime-sum-pairs 6)


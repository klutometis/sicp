(load "eqv-sum-triple.scm")
(load "unique-triples.scm")

(define (sum-triples n sum)
  (filter (lambda (triplet) (eqv-sum-triple? sum triplet))
          (unique-triples n)))

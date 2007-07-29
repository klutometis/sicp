(load "cond-predicate.scm")

(define (cond-else-clause? clause)
  (eq? (cond-predicate clause) 'else))

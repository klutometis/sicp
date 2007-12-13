;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "eqv-sum-triple.scm")
(load "unique-triples.scm")

(define (sum-triples n sum)
  (filter (lambda (triplet) (eqv-sum-triple? sum triplet))
          (unique-triples n)))

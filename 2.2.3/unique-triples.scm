;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "enumerate-interval.scm")
(load "nil.scm")
(load "unique-pairs.scm")
(load "flatmap.scm")

(define (unique-triples n)
  (flatmap (lambda (i)
             (map (lambda (j)
                    (cons i j))
                  (unique-pairs (- i 1))))
                   (enumerate-interval 1 n)))

(unique-triples 5)

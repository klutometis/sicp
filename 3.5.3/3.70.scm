;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test.scm")
(load "integers.scm")
(load "weighted-pairs.scm")
(load "divisible?.scm")

(define summed-integers
  (stream-head (weighted-pairs
                integers
                integers
                (lambda (pair) (+ (car pair) (cadr pair)))) 10))

(define indivisible-2-3-5
  (stream-filter
   (lambda (n)
     (not (or (divisible? n 2) (divisible? n 3) (divisible? n 5))))
   integers))

(define (sum-2-3-5 pair)
  (let ((i (car pair))
        (j (cadr pair)))
    (+ (* 2 i) (* 3 j) (* 5 i j))))

(define indivisible-integers
  (stream-head (weighted-pairs
                indivisible-2-3-5
                indivisible-2-3-5
                sum-2-3-5) 10))
            
(test
 "positive integers i <= j ordered by i + j"
 '((0 0) (0 1) (0 2) (1 1) (1 2) (0 3) (0 4) (1 3) (2 2) (2 3))
 summed-integers
 'equal?
 equal?)

(test
 "x e I ({2, 3, 5} ~| x) ordered by 2i + 3j + 5ij"
 '((1 1) (1 7) (1 11) (1 13) (1 17) (1 19) (1 23) (1 29) (1 31) (7 7))
 indivisible-integers
 'equal?
 equal?)

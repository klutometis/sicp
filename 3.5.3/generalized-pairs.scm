;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "interleave.scm")

(define (generalized-pairs s t combinator)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (combinator
    (stream-map (lambda (x) (list (stream-car s) x))
                (stream-cdr t))
    (generalized-pairs (stream-cdr s) (stream-cdr t) combinator))))

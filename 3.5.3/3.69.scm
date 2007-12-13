;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test.scm")
(load "natural-numbers.scm")
(load "triples.scm")

(define pythagorean-triples
  (stream-filter (lambda (triple)
                   (let ((x (list-ref triple 0))
                         (y (list-ref triple 1))
                         (z (list-ref triple 2)))
                     (= (+ (square x) (square y)) (square z))))
                 (triples natural-numbers natural-numbers natural-numbers)))

(define calculated-triples (stream-head pythagorean-triples 2))

(test
 "pythagorean triples culled from raw triples-stream"
 '((3 4 5) (6 8 10))
 calculated-triples
 'equal?
 equal?
 "http://www.math.uic.edu/~fields/puzzle/triples.html")

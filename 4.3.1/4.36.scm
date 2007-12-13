;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test.scm")
(load "install-packages.scm")
(load "ambeval-global.scm")
(load "ambeval-global-n.scm")
(load "an-integer-starting-from.scm")
(load "an-integer-between.scm")
(load "require.scm")

(install-packages)
(ambeval-global require)
(ambeval-global an-integer-starting-from)
(ambeval-global an-integer-between)

(ambeval-global
 '(define (a-pythagorean-triple-from low)
    (let ((i (an-integer-starting-from low)))
      (let ((j (an-integer-between low i)))
        (let ((k (an-integer-between low j)))
          (require (= (+ (* k k) (* j j)) (* i i)))
          (list k j i))))))

(define unbounded-triples-10 (ambeval-global-n '(a-pythagorean-triple-from 1) 10))

(test
 "unbounded triples ambiguously (first ten)"
 '((3 4 5) (6 8 10) (5 12 13) (9 12 15) (8 15 17) (12 16 20)
   (15 20 25) (7 24 25) (10 24 26) (20 21 29))
 unbounded-triples-10
 'equal? equal?
 "http://www.math.uic.edu/~fields/puzzle/triples.html")

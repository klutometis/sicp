#!/usr/bin/env chicken-scheme
(use test)

(test 10 10)
(test 12 (+ 5 3 4))
(test 8 (- 9 1))
(test 3 (/ 6 2))
(test 6 (+ (* 2 4) (- 4 6)))
(define a 3)
(define b (+ a 1))
(test 19 (+ a b (* a b)))
(test #f (= a b))
(test 4
      (if (and (> b a) (< b (* a b)))
          b
          a))
(test 16
      (cond ((= a 4) 6)
            ((= b 4) (+ 6 7 a))
            (else 25)))
(test 6
      (+ 2 (if (> b a) b a)))
(test 16
      (* (cond ((> a b) a)
               ((< a b) b)
               (else -1))
         (+ a 1)))

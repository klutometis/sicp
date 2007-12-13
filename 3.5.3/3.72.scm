;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test.scm")
(load "weighted-pairs.scm")
(load "integers.scm")

(define (sum-squares pair)
  (let ((m (car pair))
        (n (cadr pair)))
    (+ (square m)
       (square n))))

(define summed-squares
  (weighted-pairs
   integers
   integers
   (lambda (pair) (sum-squares pair))))

(define (triple-summed-squares squares sum-squares)
  (let ((s1 (stream-car squares))
        (s2 (stream-car (stream-cdr squares)))
        (s3 (stream-car (stream-cdr (stream-cdr squares)))))
    (if (= (sum-squares s1) (sum-squares s2) (sum-squares s3))
        (cons-stream (list (sum-squares s1) s1 s2 s3)
                     (triple-summed-squares
                      (stream-cdr (stream-cdr (stream-cdr squares))) sum-squares))
        (triple-summed-squares (stream-cdr squares) sum-squares))))

(define triple-summed-squares
  (stream-head (triple-summed-squares summed-squares sum-squares) 10))

(test
 "squares written in three different ways"
 '((325 (10 15) (6 17) (1 18)) (425 (13 16) (8 19) (5 20)) (625 (15 20) (7 24) (0 25)) (650 (17 19) (11 23) (5 25)) (725 (14 23) (10 25) (7 26)) (845 (19 22) (13 26) (2 29)) (850 (15 25) (11 27) (3 29)) (925 (21 22) (14 27) (5 30)) (1025 (20 25) (8 31) (1 32)) (1105 (23 24) (12 31) (9 32)))
 triple-summed-squares
 'equal?
 equal?
 "http://www.research.att.com/~njas/sequences/A000443")

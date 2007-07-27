(load "test.scm")
(load "weighted-pairs.scm")
(load "integers.scm")

(define (sum-cubes pair)
  (let ((m (car pair))
        (n (cadr pair)))
    (+ (expt m 3)
       (expt n 3))))

(define summed-cubes
  (weighted-pairs
   integers
   integers
   (lambda (pair) (sum-cubes pair))))

(define (ramanujan cubes sum-cubes)
  (let ((c1 (stream-car cubes))
        (c2 (stream-car (stream-cdr cubes))))
    (if (= (sum-cubes c1) (sum-cubes c2))
        (cons-stream (sum-cubes c1) (ramanujan (stream-cdr (stream-cdr cubes)) sum-cubes))
        (ramanujan (stream-cdr cubes) sum-cubes))))

(define ramanujan-numbers
  (stream-head (ramanujan summed-cubes sum-cubes) 10))

(test
 "ramanujan numbers"
 '(1729 4104 13832 20683 32832 39312 40033 46683 64232 65728)
 ramanujan-numbers
 'equal?
 equal?
 "http://www.research.att.com/~njas/sequences/A001235")

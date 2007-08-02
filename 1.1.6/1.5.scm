(load "test.scm")

(define (test-order x y)
  (if (= x 0)
      0
      y))

;; Forces normal order;
;; 0.
(define (p) (delay p))
(define normal-test (test-order 0 (p)))

(test
 "normal order"
 0
 normal-test
 '= =)

;; Applicative order (default);
;; never returns.
(define (p) (p))
(define applicative-test (test-order 0 (p)))

(test
 "applicative order"
 '?
 applicative-test
 '= =)

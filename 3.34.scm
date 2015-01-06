#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*3.33][3\.33:1]]

(use sicp-constraints test)

(define (averager a b c)
  (let ((x (make-connector))
        (y (make-connector)))
    (adder a b x)
    (multiplier c y x)
    (constant 2 y)
    'ok))

(define a (make-connector))
(define b (make-connector))
(define c (make-connector))

(averager a b c)
(set-value! a 3 'user)
(set-value! b 5 'user)

(test 4 (get-value c))

;; 3\.33:1 ends here

;; [[file:~/prg/sicp-klutometis/sicp.org::*3.34][3\.34:1]]

(use sicp-constraints test)

(define (squarer a b)
  (multiplier a a b))

(let ((a (make-connector))
      (b (make-connector)))
  (squarer a b)

  (set-value! b 4 'user)
  (test-assert "a has not been set." (not (has-value? a)))

  (forget-value! b 'user)
  (set-value! a 2 'user)
  (test "b is 4." 4 (get-value b)))

;; 3\.34:1 ends here

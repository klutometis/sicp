;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test-context.scm")

(define (test-order x y)
  (if (= x 0)
      0
      y))

;; Normal order
(define (normal-p) (delay normal-p))

;; Applicative order
(define (applicative-p) (applicative-p))

(define normal-test (test-order 0 (normal-p)))

(test
 "normal order"
 0
 normal-test
 '= =)

(try-kill
 (lambda () (define applicative-test (test-order 0 (p))))
 "applicative order never returns"
 1000)

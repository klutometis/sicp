#!/usr/bin/env chicken-scheme
(use test)

(include "make-account.scm")

(define (make-joint account old-password new-password)
  (lambda (password message)
    (if (eq? password new-password)
        (account old-password message)
        (lambda (amount) "Incorrect password"))))

(let* ((peter (make-account 100 'old-password))
       (paul (make-joint peter 'old-password 'new-password)))
  (test 80 ((peter 'old-password 'withdraw) 20))
  (test 60 ((paul 'new-password 'withdraw) 20))
  (test "Incorrect password" ((peter 'not-old-password 'withdraw) 20))
  (test "Incorrect password" ((paul 'not-new-password 'withdraw) 20)))

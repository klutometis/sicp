#!/usr/bin/env chicken-scheme
(use test)

(include "make-account.scm")

(let ((acc (make-account 100 'password)))
  (test 60 ((acc 'password 'withdraw) 40))
  (test "Incorrect password" ((acc 'not-password 'withdraw) 40)))

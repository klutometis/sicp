#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*3.3][3\.3:1]]

(use test)

(include "make-account.scm")

(let ((acc (make-account 100 'password)))
  (test 60 ((acc 'password 'withdraw) 40))
  (test "Incorrect password" ((acc 'not-password 'withdraw) 40)))

;; 3\.3:1 ends here

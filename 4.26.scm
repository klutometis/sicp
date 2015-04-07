#!/usr/bin/env chicken-scheme

(use bindings sicp test)

(define-macro (unless* condition usual-value exceptional-value)
  `(if ,condition ,exceptional-value ,usual-value))

(test-error "Unless* is not a procedure"
            (map unless*
                 (list (even? 2)
                       (odd? 3))
                 (list "Even failure"
                       "Odd failure")
                 (list "Even success"
                       "Odd success")))

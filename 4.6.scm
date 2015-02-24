#!/usr/bin/env chicken-scheme

(use sicp-eval test)

(include "eval-let.scm")

(with-primitive-procedures `((display ,display)
                             (+ ,+))
  (lambda (env)
    (test 10 (eval* '(let ((x (+ 2 2)) (y (+ 3 3))) (display x) (+ x y))
                    env))))

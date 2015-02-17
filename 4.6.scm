#!/usr/bin/env chicken-scheme

(use sicp-eval test)

(include "eval-let.scm")

(parameterize ((primitive-procedures
                (append `((display ,display) (+ ,+))
                        (primitive-procedures))))
  (let ((env (setup-environment)))
    (test 10 (eval* '(let ((x (+ 2 2)) (y (+ 3 3))) (display x) (+ x y))
                    env))))

(load "the-global-environment.scm")
(load "eval.scm")

(eval '((lambda () 2)) the-global-environment)

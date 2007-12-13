;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "no-operands?.scm")
(load "first-operand.scm")
(load "rest-operands.scm")
(load "get.scm")
(load "notated-parameter-notation.scm")

(define (list-of-notated-args exps notations env)
  (map (lambda (exp notation)
         ((get notation) exp env)) exps notations))

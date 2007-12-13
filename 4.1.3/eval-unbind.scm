;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "make-unbound!.scm")
(load "definition-variable.scm")
(load "definition-value.scm")

(define (eval-unbind exp env)
  (make-unbound! (definition-variable exp) env)
  'ok)

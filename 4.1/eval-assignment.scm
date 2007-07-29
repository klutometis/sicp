(load "set-variable-value!.scm")
(load "assignment-variable.scm")
(load "assignment-value.scm")

(define (eval-assignment exp env)
  (set-variable-value! (assignment-variable exp)
                       (eval (assignment-value exp) env)
                       env)
  'ok)

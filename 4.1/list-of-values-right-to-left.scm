(load "last-operand.scm")
(load "except-last-operand.scm")

(define (list-of-values exps env)
  (if (no-operands? exps)
      '()
      (let ((last (eval (last-operand exps) env)))
        (cons last (list-of-values (except-last-pair exps) env)))))

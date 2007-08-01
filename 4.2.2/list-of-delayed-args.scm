(load "no-operands?.scm")
(load "delay-it.scm")
(load "first-operand.scm")
(load "rest-operands.scm")

(define (list-of-delayed-args exps env)
  (if (no-operands? exps)
      '()
      (cons (delay-it (first-operand exps) env)
            (list-of-delayed-args (rest-operands exps)
                                  env))))

     

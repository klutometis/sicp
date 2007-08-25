(define eceval
  (make-machine
   '(exp env val proc argl continue unev)
   eceval-operations
   (fold-right
    append '() (list
                eval
;;                 read-eval-print-loop
;;                 print-result
                unknown-expression-type
                unknown-procedure-type
;;                signal-error
                perform-error
                eval-dispatch
                ev-self-eval
                ev-variable
                ev-quoted
                ev-lambda
                ev-application
                ev-appl-did-operator
                ev-appl-operand-loop
                ev-appl-accumulate-arg
                ev-appl-last-arg
                ev-appl-accum-last-arg
                apply-dispatch
                primitive-apply
                compound-apply
                ev-begin
                ev-sequence
                ev-sequence-continue
                ev-sequence-last-exp
                ev-if
                ev-if-decide
                ev-if-alternative
                ev-if-consequent
                ev-assignment-1
                ev-assignment
                ev-definition-1
                ev-definition
                done)
    )))

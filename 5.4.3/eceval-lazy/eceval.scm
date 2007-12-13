;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define eceval
  (make-machine
   '(exp env val proc argl continue unev tmp)
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
                ev-appl-delayed-operand-loop 
                ev-appl-operand-value-loop
                ev-appl-accumulate-delayed-arg
                ev-appl-accumulate-arg-value
                ev-appl-last-delayed-arg
                ev-appl-last-arg-value
                ev-appl-accum-last-delayed-arg
                ev-appl-accum-last-arg-value
                delay-it
                force-it
                force-it-thunk
                actual-value
                apply-dispatch
                primitive-apply
                compound-apply
                ev-and
                ev-cond
                ev-or
                ev-let
                ev-let*
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

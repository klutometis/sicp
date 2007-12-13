;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define ev-appl-operand-value-loop
  '(ev-appl-operand-value-loop
    (save argl)
    (assign exp (op first-operand) (reg unev))
    (test (op last-operand?) (reg unev))
    (branch (label ev-appl-last-arg-value))
    (save env)
    (save unev)
    (assign continue (label ev-appl-accumulate-arg-value))
    (goto (label actual-value))))

;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define force-it-thunk
  '(force-it-thunk
    (assign exp (op thunk-exp) (reg val))
    (assign env (op thunk-env) (reg val))
    (goto (label actual-value))))

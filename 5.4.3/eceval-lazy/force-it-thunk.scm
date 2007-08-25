(define force-it-thunk
  '(force-it-thunk
    (assign exp (op thunk-exp) (reg val))
    (assign env (op thunk-env) (reg val))
    (goto (label actual-value))))

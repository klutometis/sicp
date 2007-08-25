(define ev-variable
  '(ev-variable
    (assign val (op lookup-variable-value) (reg exp) (reg env))
    (goto (reg continue))))

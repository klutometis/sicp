(define primitive-apply
  '(primitive-apply
    (assign val (op apply-primitive-procedure)
            (reg proc)
            (reg argl))
    (restore continue)
    (goto (reg continue))))

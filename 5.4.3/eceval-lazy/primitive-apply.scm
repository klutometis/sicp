(define primitive-apply
  '(primitive-apply
    (assign val (op apply-primitive-procedure)
            (reg proc)
            (reg argl))
    (restore continue)
;;     (perform (op write-line) (reg continue))
;;     (perform (op write-line) (reg proc))
;;     (perform (op write-line) (reg argl))
;;     (perform (op write-line) (reg val))
;;     (perform (op write-line) (reg exp))
    (goto (reg continue))
    ))

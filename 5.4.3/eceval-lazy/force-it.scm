(define force-it
  '(force-it
;;     (restore continue)
;;     (restore env)
;;     (restore exp)
    (test (op thunk?) (reg val))
    (branch (label force-it-thunk))
    (restore continue)
    (goto (label eval-dispatch))))

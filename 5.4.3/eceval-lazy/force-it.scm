(define force-it
  '(force-it
;;     (restore continue)
;;     (restore env)
;;     (restore exp)
    (restore continue)
;;     (restore exp)
;;     (restore env)
    (test (op thunk?) (reg val))
    (branch (label force-it-thunk))
;;     (restore exp)
;;    (goto (label eval-dispatch))
    (goto (reg continue))
    ))

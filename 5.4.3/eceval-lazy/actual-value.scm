(define actual-value
  '(actual-value
;;     (save exp)
;;     (save env)
;;     (save continue)
    (save continue)
    (assign continue (label force-it))
    (goto (label eval-dispatch))))

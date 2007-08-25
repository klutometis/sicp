(define read-eval-print-loop
  '(read-eval-print-loop
    (perform (op initialize-stack))
    (perform
     (op prompt-for-input) (const ";;; EC-Eval input:"))
    (assign exp (op read))
    (assign env (op get-global-environment))
    (assign continue (label print-result))
    (goto (label eval-dispatch))))

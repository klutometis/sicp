(define print-result
  '(print-result
    (perform (op print-stack-statistics))
    (perform
     (op announce-output) (const ";;; EC-Eval value:"))
    (perform (op user-print) (reg val))
    (goto (label read-eval-print-loop))))

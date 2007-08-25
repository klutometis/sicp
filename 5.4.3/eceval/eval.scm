(define eval
  '(eval
    (perform (op initialize-stack))
    (assign continue (label done))
    (goto (label eval-dispatch))))

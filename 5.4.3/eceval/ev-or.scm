(define ev-or
  '(ev-or
    (assign exp (op or->if) (reg exp))
    (goto (label eval-dispatch))))

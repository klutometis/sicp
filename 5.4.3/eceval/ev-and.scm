(define ev-and
  '(ev-and
    (assign exp (op and->if) (reg exp))
    (goto (label eval-dispatch))))

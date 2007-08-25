(define ev-if-alternative
  '(ev-if-alternative
    (assign exp (op if-alternative) (reg exp))
    (goto (label eval-dispatch))))

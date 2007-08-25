(define ev-let
  '(ev-let
    (assign exp (op let->combination) (reg exp))
    (goto (label eval-dispatch))))

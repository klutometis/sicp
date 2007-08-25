(define ev-appl-accum-last-delayed-arg
  '(ev-appl-accum-last-delayed-arg
    (restore argl)
    (assign argl (op adjoin-arg) (reg val) (reg argl))
    (restore proc)
    (goto (label apply-dispatch))))

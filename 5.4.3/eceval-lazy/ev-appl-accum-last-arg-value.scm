(define ev-appl-accum-last-arg-value
  '(ev-appl-accum-last-arg-value
    (restore argl)
    (assign argl (op adjoin-arg) (reg val) (reg argl))
    (restore proc)
    (goto (label apply-dispatch))))

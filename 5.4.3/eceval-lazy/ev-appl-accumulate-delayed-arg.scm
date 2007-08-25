(define ev-appl-accumulate-delayed-arg
  '(ev-appl-accumulate-delayed-arg
    (restore unev)
    (restore env)
    (restore argl)
    (assign argl (op adjoin-arg) (reg val) (reg argl))
    (assign unev (op rest-operands) (reg unev))
    (goto (label ev-appl-delayed-operand-loop))))

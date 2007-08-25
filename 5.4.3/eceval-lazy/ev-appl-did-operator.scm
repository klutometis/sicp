(define ev-appl-did-operator
  '(ev-appl-did-operator
    (restore unev)
    (restore env)
    (assign argl (op empty-arglist))
    (assign proc (reg val))
    (test (op no-operands?) (reg unev))
    (branch (label apply-dispatch))
    (save proc)
    (test (op compound-procedure?) (reg proc))
    (branch (label ev-appl-delayed-operand-loop))
    (goto (label ev-appl-operand-value-loop))))

(define perform-error
  '(signal-error
    (perform (op error) (const "Error -- MCEVAL") (reg val))))

(define (add-action! wire action-procedure)
  ((wire 'add-action!) action-procedure))

(define (set-contents! register value)
  ((register 'set) value))

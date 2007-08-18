(define (set-register-contents! machine register-name value)
  (set-contents! (get-register machine register-name) value)
  'done)

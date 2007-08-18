(define (advance-pc pc)
  (set-contents! pc (cdr (get-contents pc))))

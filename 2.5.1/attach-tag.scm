(define (attach-tag type-tag contents)
  (if (and (eq? type-tag 'scheme-number) (number? contents))
      contents
      (cons type-tag contents)))


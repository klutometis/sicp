(define (bindings frames)
  (let ((bindings '()))
    (for-each
     (lambda (frame)
       (for-each
        (lambda (binding)
          (let ((addendum (list binding)))
            (if (null? bindings)
                (set! bindings addendum)
                (append! bindings addendum)))) frame)) frames)
    bindings))

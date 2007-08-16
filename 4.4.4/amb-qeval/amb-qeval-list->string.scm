(define (amb-qeval-list->string list)
  (with-output-to-string
    (lambda ()
      (write list))))


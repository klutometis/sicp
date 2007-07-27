(define (stream-limit stream tolerance)
  (if (stream-null? stream)
      the-empty-stream
      (let ((current (stream-ref stream 0))
            (next (stream-ref stream 1)))
        (if (< (abs (- current next)) tolerance)
            next
            (stream-limit (stream-cdr stream) tolerance)))))

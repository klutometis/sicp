(define (stream-converge stream tolerance)
  (if (stream-null? stream)
      the-empty-stream
      (let ((current (stream-ref stream 0))
            (next (stream-ref stream 1)))
        (cons-stream
         current
         (if (< (abs (- current next)) tolerance)
             (cons-stream next the-empty-stream)
             (stream-converge (stream-cdr stream) tolerance))))))

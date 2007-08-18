(define (uniquely-asserted contents frame-stream)
  (stream-flatmap
   (lambda (frame)
     (let ((qeval-stream (qeval (car contents) (singleton-stream frame))))
       (if (= 1 (stream-length qeval-stream))
           qeval-stream
           the-empty-stream)))
   frame-stream))

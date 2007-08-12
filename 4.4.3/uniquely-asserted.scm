(define (uniquely-asserted contents frame-stream)
;  (write-line (stream->list frame-stream))
  (stream-flatmap
   (lambda (frame)
;     (write-line (stream->list (qeval (car contents) (singleton-stream frame))))
     (let ((qeval-stream (qeval (car contents) (singleton-stream frame))))
;       (write-line (stream->list qeval-stream))
;       (write-line qeval-stream)
       (if (= 1 (stream-length qeval-stream))
           qeval-stream
           the-empty-stream)))
     frame-stream))

(define (query exp)
  (let ((q (query-syntax-process exp)))
    (cond ((assertion-to-be-added? q)
           (add-rule-or-assertion! (add-assertion-body q))
           'ok)
          (else
           (stream->list                ; Watch out for infinite streams
            (stream-map
             (lambda (frame)
               (instantiate q
                            frame
                            (lambda (v f)
                              (contract-question-mark v))))
             (qeval q (singleton-stream '()))))))))

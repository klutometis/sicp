(define (qeval query environment-stream)
  (let ((qproc (get (type query) 'qeval)))
    (if qproc
        (qproc (contents query) environment-stream)
        (simple-query query environment-stream))))

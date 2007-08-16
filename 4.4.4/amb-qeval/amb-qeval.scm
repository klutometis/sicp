(define amb-qeval
  '(define (amb-qeval query data-base)
     (let ((amb-qproc (amb-qeval-get (amb-qeval-type query))))
       (if amb-qproc
           (amb-qproc (amb-qeval-contents query) data-base)
           (amb-qeval-simple-query query data-base)))))

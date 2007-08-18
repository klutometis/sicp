(define (negate operands frame-stream)
  (stream-flatmap
   (lambda (frame)
     (let* ((negated-query (negated-query operands))
            (frame (if (all-bound? operands frame)
                       frame
                       (negate-bind negated-query frame))))
       (let ((qeval (qeval negated-query (singleton-stream frame))))
         (if (or (stream-null? qeval)
                 (negate-bound frame))
             (singleton-stream frame)
             the-empty-stream))))
   frame-stream))
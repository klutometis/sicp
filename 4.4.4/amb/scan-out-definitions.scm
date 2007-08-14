(define (scan-out-definitions body)
  (define (definitions expressions)
    (keep-matching-items expressions definition?))
  (define (values expressions)
    (delete-matching-items expressions definition?))
  (define (assignments definitions)
    (map (lambda (definition) (make-assignment
                               (definition-variable definition)
                               (definition-value definition))) definitions))
  (define (unassignments definitions)
    (map (lambda (definition) (make-unassignment
                               (definition-variable definition))) definitions))
  (let* ((definitions (definitions body))
         (values (values body)))
    (if (null? definitions)
        values
        (list (make-let (unassignments definitions)
                        (append (assignments definitions)
                                values))))))

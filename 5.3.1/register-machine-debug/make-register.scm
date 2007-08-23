(define (make-register name)
  (let ((contents '*unassigned*)
        (traced false))
    (define (dispatch message)
      (cond ((eq? message 'get) contents)
            ((eq? message 'set)
             (lambda (value)
               (if traced
                   (format #t "~A: ~A -> ~A~%"
                           name
                           contents
                           value))
                   (set! contents value)))
            ((eq? message 'trace-on)
             (set! traced true)
             'ok)
            ((eq? message 'trace-off)
             (set! traced false)
             'ok)
            (else
             (error "Unknown request -- REGISTER" message))))
    dispatch))

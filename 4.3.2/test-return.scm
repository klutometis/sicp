(define (test-return test-name result)
  (let ((value (test
                test-name
                #!default
                #!default
                'eq? eq?)))
    (format #t "value: ~A~%~%" value)))

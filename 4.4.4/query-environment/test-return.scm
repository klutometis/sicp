(define (test-return test-name result)
  (let ((value (test
                test-name
                result
                #!default
                'eq? eq?)))
    (format #t "value: ~A~%~%" value)))

(define (try-kill assay test-name interval)
  (let ((result #!default))
    (let ((filum
           (create-thread
            #f (lambda () (assay)))))
      (register-timer-event
       interval
       (lambda () (kill-thread filum) (test-return test-name result))))))

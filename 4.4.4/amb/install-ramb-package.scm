(define (install-ramb-package)
  (define (analyze-ramb exp)
    (let ((cprocs (map analyze (amb-choices exp))))
      (lambda (env succeed fail)
        (define (try-next choices)
          (if (null? choices)
              (fail)
              ((car choices) env
               succeed
               (lambda ()
                 (try-next (cdr choices))))))
        (try-next (randomize cprocs)))))
  (put-amb 'amb analyze-ramb))

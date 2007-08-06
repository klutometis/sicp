(load "put.scm")
(load "amb-choices.scm")
(load "analyze.scm")

(define (install-reverse-amb-package)
  (define (analyze-amb exp)
    (let ((cprocs (map analyze (amb-choices exp))))
      (lambda (env succeed fail)
        (define (try-next choices)
          (if (null? choices)
              (fail)
              ((car choices) env
               succeed
               (lambda ()
                 (try-next (cdr choices))))))
        (try-next (reverse cprocs)))))
  (put 'amb analyze-amb))

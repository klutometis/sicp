;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (install-amb-package)
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
        (try-next cprocs))))
  (put-amb 'amb (lambda (exp) (analyze-amb exp)))
  'done)

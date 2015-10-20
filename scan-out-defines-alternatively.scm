#!/usr/bin/env chicken-scheme
(include "make-simultaneous-scope.scm")

(define (scan-out-defines-alternatively body)
  (call-with-values (lambda () (partition definition? body))
    (lambda (definitions body)
      ;; To avoid pathological recursion, do nothing if there are
      ;; not any internal definitions.
      (if (null? definitions)
          body
          (let ((variables (map definition-variable definitions))
                (values (map definition-value definitions)))
            ;; We had to add an extra list here to simulate the body.
            (list (make-simultaneous-scope variables values body)))))))

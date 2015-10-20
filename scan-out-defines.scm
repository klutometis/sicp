#!/usr/bin/env chicken-scheme
(define (scan-out-defines body)
  (call-with-values (lambda () (partition definition? body))
    (lambda (definitions body)
      ;; To avoid pathological recursion, do nothing if there are not
      ;; any internal definitions.
      (if (null? definitions)
          body
          (let ((bindings
                 (map (lambda (definition)
                        `(,(definition-variable definition) '*unassigned*))
                      definitions))
                (sets!
                 (map (lambda (definition)
                        `(set!
                          ,(definition-variable definition)
                          ,(definition-value definition)))
                      definitions)))
            ;; We had to add an extra list here to simulate the body.
            `((let ,bindings ,@sets! ,@body)))))))

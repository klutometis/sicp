;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load-option 'format)

(define (test
         test-name
         expected-value
         given-value
         test
         predicate
         #!optional
         expected-value-source)
  (define (report rubric value)
    (format #t "~A: ~A~%" rubric value))
  (report 'test-name test-name)
  (report 'expected-value-source
          (if (default-object? expected-value-source)
              'canonical                ; Id est, "don't ask."
              expected-value-source))
  (report 'expected-value expected-value)
  (report 'given-value given-value)
  (report 'test test)
  (predicate expected-value given-value))

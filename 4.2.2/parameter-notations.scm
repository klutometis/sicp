(load "notated-parameter?.scm")
(load "notated-parameter-notation.scm")

(define (parameter-notations procedure)
  (let ((parameters (cadr procedure)))
    (map (lambda (parameter)
           (if (notated-parameter? parameter)
               (notated-parameter-notation parameter)
               'strict)) parameters)))

(load "notated-parameter?.scm")
(load "notated-parameter-variable.scm")

(define (procedure-parameters p)
  (let ((notated-parameters (cadr p)))
    (map (lambda (parameter)
           (if (notated-parameter? parameter)
               (notated-parameter-variable parameter)
               parameter)) notated-parameters)))


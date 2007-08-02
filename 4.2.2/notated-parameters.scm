(load "notated-parameter?.scm")

(define (notated-parameters parameters)
  (map (lambda (parameter)
         (if (notated-parameter? parameter)
             parameter
             (list parameter 'strict)))))

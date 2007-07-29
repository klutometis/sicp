(load "compound-procedure?.scm")
(load "procedure-parameters.scm")
(load "procedure-body.scm")

(define (user-print object)
  (if (compound-procedure? object)
      (display (list 'compound-procedure
                     (procedure-parameters object)
                     (procedure-body object)
                     '<procuder-env>))
      (display object)))

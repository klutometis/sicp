;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (instantiate exp environment unbound-var-handler)
  (define (copy exp)
    (cond ((var? exp)
           (if (environment-bound-symbol? environment exp)
               (copy (environment-lookup-symbol environment exp))
               (unbound-var-handler exp environment)))
          ((pair? exp)
           (cons (copy (car exp)) (copy (cdr exp))))
          (else exp)))
  (copy exp))

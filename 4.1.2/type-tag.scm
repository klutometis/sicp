;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "get.scm")

(define (type-tag exp)
  (cond ((or (number? exp) (string? exp)) 'self-evaluating)
        ((symbol? exp) 'variable)
        ((pair? exp)
         (let ((tag (car exp)))
           (if (get tag)
               tag
               'application)))
        (else (error "Unknown type -- TYPE-TAG" exp))))

               

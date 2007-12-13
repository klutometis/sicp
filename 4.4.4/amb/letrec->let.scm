;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (letrec->let expression)
  (define (unassignments variables)
    (map make-unassignment variables))
  (define (assignments variables values)
    (map make-assignment variables values))
  (let* ((bindings (letrec-bindings expression))
         (variables (map letrec-binding-variable bindings))
         (values (map letrec-binding-value bindings))
         (body (letrec-body expression)))
    (make-let (unassignments variables)
              (append (assignments variables values)
                      body))))

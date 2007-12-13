;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (combine frames)
  (define (combine new-bindings bindings)
    (if (null? bindings)
        new-bindings
        (let* ((binding (car bindings))
               (rest-bindings (cdr bindings))
               (variable (binding-variable binding))
               (value (binding-value binding))
               (previous-association (assoc variable new-bindings)))
          (if previous-association
              (if (equal? value (binding-value previous-association))
                  (combine new-bindings rest-bindings)
                  'failed)
              (combine (cons binding new-bindings) rest-bindings)))))
  (combine '() (bindings frames)))

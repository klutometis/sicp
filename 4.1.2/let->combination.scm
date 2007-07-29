(load "let-binding-variable.scm")
(load "let-bindings.scm")
(load "let-binding-value.scm")
(load "let-body.scm")

(define (let->combination exp)
  (let* ((bindings (let-bindings exp))
         (variables (map let-binding-variable bindings))
         (values (map let-binding-value bindings))
         (body (let-body exp)))
    (cons (list 'lambda variables body) values)))


(load "let*-bindings")
(load "let*-body")

(define (let*->nested-lets exp)
  (let ((bindings (let*-bindings exp))
        (body (let*-body exp)))
    (let descend ((bindings bindings))
      (if (null? bindings)
          body
          (list 'let (list (car bindings)) (descend (cdr bindings)))))))

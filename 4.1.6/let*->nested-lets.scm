;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "let*-bindings")
(load "let*-body")
(load "make-let.scm")
(load "make-nested-let.scm")

(define (let*->nested-lets exp)
  (let ((bindings (let*-bindings exp))
        (body (let*-body exp)))
    (let descend ((bindings bindings))
      (if (null? (cdr bindings))
          (make-let (list (car bindings)) body)
          (make-nested-let (list (car bindings)) (descend (cdr bindings)))))))

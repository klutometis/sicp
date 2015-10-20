#!/usr/bin/env chicken-scheme
(use sicp sicp-eval test)

(include "eval-let.scm")

;;; This is a little awkward: the bottom line is that the let-body
;;; should be unquote-spliced, whereas the nested lets should be
;;; simply unquoted; we decided to wrap the nested lets in an
;;; additional list to counteract the splice and car the final
;;; product.
(define (let*->nested-lets exp)
  (car (let iter ((clauses (let-clauses exp)))
         (if (null? clauses)
             (let-body exp)
             `((let (,(car clauses))
                 ,@(iter (cdr clauses))))))))

(put 'eval 'let* (lambda (exp env) (eval* (let*->nested-lets exp) env)))

(with-primitive-procedures `((+ ,+) (* ,*))
  (lambda (env)
    (test 39 (eval* '(let* ((x 3) (y (+ x 2)) (z (+ x y 5)))
                       (* x z)) env))))

#!/usr/bin/env chicken-scheme
(use sicp-eval srfi-1 test)

(include "data-directed-eval.scm")

(define (do-variables exp) (cadr exp))
(define (do-test exp) (caddr exp))
(define (do-test-predicate test) (car test))
(define (do-test-body test) (cdr test))
(define (do-body exp) (cdddr exp))
(define (do-variable-name variable) (car variable))
(define (do-variable-init variable) (cadr variable))
(define (do-variable-has-step? variable) (not (null? (cddr variable))))
(define (do-variable-step variable)
  (if (do-variable-has-step? variable)
      (caddr variable)
      ;; This amounts to the identity function.
      (do-variable-name variable)))
(define (do-variable-names&inits variables)
  (map (lambda (variable) (list (do-variable-name variable)
                           (do-variable-init variable)))
       variables))

(define (do->named-let exp)
  (let ((variables (do-variables exp))
        ;; We had to resort to gensym here for the outer named let.
        (iter (gensym)))
    (let ((test (do-test exp)))
      `(let ,iter ,(do-variable-names&inits variables)
            (if ,(do-test-predicate test)
                (begin ,@(do-test-body test))
                (begin
                  ,@(do-body exp)
                  (,iter ,@(map do-variable-step variables))))))))

(put 'eval 'do (lambda (exp env) (eval* (do->named-let exp) env)))

(with-primitive-procedures `((make-vector ,make-vector)
                             (+ ,+)
                             (= ,=)
                             (vector-set! ,vector-set!))
  (lambda (env)
    (test '#(0 1 2 3 4)
          (eval* '(do ((vec (make-vector 5))
                       (i 0 (+ i 1)))
                      ((= i 5) vec)
                    (vector-set! vec i i))
                 env))))

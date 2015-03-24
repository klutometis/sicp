#!/usr/bin/env chicken-scheme

(use sicp-eval test)

(include "eval-let.scm")
(include "data-directed-eval.scm")
(include "make-simultaneous-scope.scm")

(define (letrec->let exp)
  (let ((clauses (let-clauses exp)))
    (let ((variables (map let-clause-variable clauses))
          (values (map let-clause-expression clauses)))
      (make-simultaneous-scope variables values (let-body exp)))))

(put 'eval 'letrec (lambda (exp env) (eval* (letrec->let exp) env)))

(with-primitive-procedures `((* ,*)
                             (- ,-)                             
                             (= ,=))
  (lambda (env)
    (test "Factorial with letrec"
          3628800
          (eval* '(letrec ((fact
                            (lambda (n) (if (= n 1) 1 (* n (fact (- n 1)))))))
                    (fact 10))
                 env))))

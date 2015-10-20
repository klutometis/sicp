#!/usr/bin/env chicken-scheme
(use bindings ports sicp-eval test)

(define-macro (cons-right a d)
  `(let ((d ,d) (a ,a)) (cons a d)))

(test "Right-eval cons"
      "21"
      (with-output-to-string
        (lambda () (cons-right (display 1) (display 2)))))

;;; This enforces left-to-right order.
(define (list-of-values exps env)
  (if (no-operands? exps)
      '()
      (let ((value (eval* (first-operand exps) env)))
        (cons-right value
                    (list-of-values (rest-operands exps) env)))))

(parameterize ((primitive-procedures
                (cons (list 'display display) (primitive-procedures))))
  (test "Left-to-right list-of-values with cons-right"
        "12"
        (with-output-to-string
          (lambda ()
            (eval* '(cons (display 1) (display 2)) (setup-environment))))))

;;; This enforces right-to-left order.
(define (list-of-values exps env)
  (if (no-operands? exps)
      '()
      (let ((rest (list-of-values (rest-operands exps) env)))
        (cons (eval* (first-operand exps) env) rest))))

(with-primitive-procedures `((display ,display))
  (lambda (env)
    (test "Right-to-left list-of-values with cons"
        "21"
        (with-output-to-string
          (lambda ()
            (eval* '(cons (display 1) (display 2)) (setup-environment)))))))

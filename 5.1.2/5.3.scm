;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "register-machine-context.scm")
(load "test-context.scm")

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(load "register-machine/sqrt-machine-primitive.scm")
(load "register-machine/sqrt-machine-arithmetic.scm")

(set-register-contents! sqrt-machine-primitive 'x 2.0)
(start sqrt-machine-primitive)
(define sqrt-primitive-2.0
  (get-register-contents sqrt-machine-primitive 'guess))

(set-register-contents! sqrt-machine-arithmetic 'x 2.0)
(start sqrt-machine-arithmetic)
(define sqrt-arithmetic-2.0
  (get-register-contents sqrt-machine-arithmetic 'guess))

(test
 "primitive produces correct result to four decimals"
 1.4142
 sqrt-primitive-2.0
 '(tolerant= x y 0.0001)
 (lambda (x y) (tolerant= x y 0.0001)))

(test
 "primitive and arithmetic machines produce the same result"
 sqrt-primitive-2.0
 sqrt-arithmetic-2.0
 '= =)

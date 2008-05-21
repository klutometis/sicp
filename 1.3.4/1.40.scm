;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../1.3.4/section)
(require '../util/util)
(import* util cube square approx?)
(import* section-1.3.4 newtons-method)

(define (cubic a b c)
  (lambda (x) (+ (cube x) (* a (square x)) (* b x) c)))

(check (newtons-method (cubic 4 5 2) 1) (=> approx?) -1.0)

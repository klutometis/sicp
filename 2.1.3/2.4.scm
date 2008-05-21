;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case)

(define (proc-cons x y)
  (lambda (m) (m x y)))

(define (proc-car z)
  (z (lambda (p q) p)))

(define (proc-cdr z)
  (z (lambda (p q) q)))

(let ((pair (proc-cons 1 2)))
  (check (cons (proc-car pair)
               (proc-cdr pair))
         => '(1 . 2)))

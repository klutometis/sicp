;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension check)

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))
(define (plus n m)
  (lambda (f) (lambda (x) ((m f) ((n f) x)))))

;;; Thanks, vixey.
(define (church-numeral->integer church-numeral)
  ((church-numeral (lambda (x) (+ x 1))) 0))

(check (church-numeral->integer (plus zero (plus one two)))
       => 3)

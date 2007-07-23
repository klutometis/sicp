(load "put.scm")
(load "make-sum.scm")
(load "make-product.scm")
(load "addend.scm")
(load "augend.scm")
(load "multiplier.scm")
(load "multiplicand.scm")
(load "deriv.scm")

(define (install-deriv-package)
  (define (deriv-+ exp var)
    (make-sum (deriv (addend exp) var)
              (deriv (augend exp) var)))
  (define (deriv-* exp var)
    (make-sum
     (make-product (multiplier exp)
                   (deriv (multiplicand exp) var))
     (make-product (deriv (multiplier exp) var)
                   (multiplicand exp))))
  (put 'deriv '+ deriv-+)
  (put 'deriv '* deriv-*)
  'done)

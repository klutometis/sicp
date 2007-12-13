;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "put.scm")
(load "attach-tag.scm")
(load "put-coercion.scm")
(load "tag-scheme-number.scm")
(load "tag-real.scm")
(load "cosine.scm")
(load "sine.scm")
(load "atangent.scm")

(define (install-scheme-number-package)
  (define (tag x)
    (tag-scheme-number x))
  (put 'add '(scheme-number scheme-number)
       (lambda (x y) (tag (+ x y))))
  (put 'sub '(scheme-number scheme-number)
       (lambda (x y) (tag (- x y))))
  (put 'mul '(scheme-number scheme-number)
       (lambda (x y) (tag (* x y))))
  (put 'div '(scheme-number scheme-number)
       (lambda (x y) (tag (/ x y))))
  (put 'make 'scheme-number
       (lambda (x) (tag x)))
  (put 'equ? '(scheme-number scheme-number)
       (lambda (x y) (= x y)))
  (put '=zero? '(scheme-number)
       (lambda (x) (zero? x)))
  (put 'exp '(scheme-number scheme-number)
       (lambda (x y) (tag (expt x y))))
  (put 'sine '(scheme-number)
       (lambda (x) (tag (sine x))))
  (put 'cosine '(scheme-number)
       (lambda (x) (tag (cos x))))
  (put 'atangent '(scheme-number)
       (lambda (x) (tag (atan x))))
  (put 'square '(scheme-number)
       (lambda (x) (tag (* x x))))
  (put 'square-root '(scheme-number)
       (lambda (x) (tag (sqrt x))))
  (put 'negate '(scheme-number)
       (lambda (x) (tag (- x))))

  (define (gcd a b)
    (if (zero? b)
        a
        (gcd b (remainder a b))))

  (put 'greatest-common-divisor '(scheme-number scheme-number)
       (lambda (x y) (tag (gcd x y))))

  (define (reduce-integers n d)
    (let ((g (gcd n d)))
      (list (/ n g) (/ d g))))

  (put 'reduce '(scheme) (lambda (x y) (reduce-integers x y)))

  'done)

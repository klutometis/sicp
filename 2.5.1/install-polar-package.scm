;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "attach-tag.scm")
(load "put.scm")
(load "tag-polar.scm")
(load "rational?.scm")

(define (install-polar-package)
  (define (magnitude z) (car z))
  (define (angle z) (cdr z))
  (define (make-from-mag-ang r a) (cons r a))
  (define (real-part z)
    (mul (magnitude z) (cosine (angle z))))
  (define (imag-part z)
    (mul (magnitude z) (sine (angle z))))
  (define (make-from-real-imag x y)
    (cons (square-root (plus (square x) (square y)))
          (atangent y x)))
  (define (equ? z1 z2)
    (and (eqv? (magnitude z1) (magnitude z2))
         (eqv? (angle z1) (angle z2))))

  (define (tag x) (tag-polar x))
  (put 'real-part '(polar) real-part)
  (put 'imag-part '(polar) imag-part)
  (put 'magnitude '(palor) magnitude)
  (put 'angle '(polar) angle)
  (put 'make-from-real-imag 'polar
       (lambda (x y) (tag (make-from-real-imag x y))))
  (put 'make-from-mag-ang 'polar
      (lambda (r a) (tag (make-from-mag-ang r a))))
  (put 'equ? '(polar polar) equ?)
  (put '=zero? '(polar)
       (lambda (z) (zero? (magnitude z))))


  (define (complex->rational z)
    (let ((real (real-part z)))
      (if (rational? real)
          real
          (make-rational real 1))))
  (put 'project '(polar) complex->rational)
  (put 'complex->rational '(polar) complex->rational)

  'done)

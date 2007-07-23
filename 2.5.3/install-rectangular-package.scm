(load "attach-tag.scm")
(load "put.scm")
(load "make-scheme-number.scm")
(load "make-complex-from-real-imag.scm")
(load "put-coercion.scm")
(load "get-coercion.scm")
(load "tag-rectangular.scm")
(load "rational?")
(load "numer.scm")
(load "denom.scm")
(load "tag-rational.scm")
(load "add.scm")
(load "div.scm")
(load "mul.scm")
(load "sub.scm")
(load "square.scm")
(load "cosine.scm")
(load "sine.scm")
(load "put-irreducible.scm")
(load "equ?.scm")
(load "negate.scm")

(define (install-rectangular-package)
  (define (real-part z) (car z))
  (define (imag-part z) (cdr z))
  (define (make-from-real-imag x y) (cons x y))
  (define (magnitude z)
    (sqrt (add (square (real-part z))
               (square (imag-part z)))))
  (define (angle z)
    (atan (imag-part z) (real-part z)))
  (define (make-from-mag-ang r a)
    (cons (mul r (cosine a)) (mul r (sine a))))
  (define (equ-rect? z1 z2)
    (and (equ? (real-part z1) (real-part z2))
         (equ? (imag-part z1) (imag-part z2))))

  (define (tag x) (tag-rectangular x))
  (put 'real-part '(rectangular) real-part)
  (put 'imag-part '(rectangular) imag-part)
  (put 'magnitude '(rectangular) magnitude)
  (put 'angle '(rectangular) angle)
  (put 'equ? '(rectangular rectangular) equ-rect?)
  (put 'make-from-real-imag 'rectangular
       (lambda (x y) (tag (make-from-real-imag x y))))
  (put 'make-from-mag-ang 'rectangular
       (lambda (r a) (tag (make-from-mag-ang r a))))
  (put '=zero? '(rectangular)
       (lambda (z) (and (=zero? (real-part z))
                        (=zero? (imag-part z)))))
  (put 'negate '(rectangular)
       (lambda (z) (make-from-real-imag (negate (real-part z))
                                        (imag-part z))))

  ;; Coercions (defunct: see complex)
  (define (rational->rectangular r)
    (put-irreducible 'rational->rectangular)
    (let ((rational (tag-rational r)))
      (tag-rectangular (make-from-real-imag
                        rational
                        0))))
  (put-coercion 'rational 'rectangular rational->rectangular)
  (put 'rational->complex '(rational)
       rational->rectangular)
  (put 'raise '(rational)
       rational->rectangular)

  (define (complex->rational z)
    (put-irreducible 'complex->rational)
    (let ((real (real-part z)))
      (if (rational? real)
          real
          (make-rational real 1))))
  (put 'project '(rectangular) complex->rational)
  (put 'complex->rational '(rectangular) complex->rational)

  'done)

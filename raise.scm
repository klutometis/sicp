#!/usr/bin/env chicken-scheme
;;; Packages

(define (install-scheme-number-conversion-package)
  (define (->rational number)
    (make-rational (numerator number)
                   (denominator number)))
  (define (->complex number)
    (make-complex-from-real-imag number 0))
  (put '->rational '(scheme-number) ->rational)
  (put '->complex '(scheme-number) ->complex))

(define (install-rational-conversion-package)
  (define numer car)
  (define denom cdr)
  (define (->real rational)
    (make-real (/ (numer rational)
                  (denom rational))))
  (put 'raise '(rational) ->real))

(define (install-complex-conversion-package)
  (put 'raise '(complex) (constantly #f)))

(define (install-integer-package)
  (define (tag object)
    (attach-tag 'integer object))
  (define (make value)
    (tag (make-scheme-number value)))
  (put 'raise '(integer) ->rational)
  (put 'make 'integer make))

(define (install-real-package)
  (define (tag object)
    (attach-tag 'real object))
  (define (make value)
    (tag (make-scheme-number value)))
  (put 'raise '(real) ->complex)
  (put 'make 'real make))

;;; Constructors

(define (make-integer i)
  ((get 'make 'integer) i))

(define (make-real x)
  ((get 'make 'real) x))

;;; Converters

(define (->rational number)
  (apply-generic '->rational number))

(define (->complex number)
  (apply-generic '->complex number))

;;; Generic raise

(define (raise number)
  (apply-generic 'raise number))

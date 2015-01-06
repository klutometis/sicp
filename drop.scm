#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.85][2\.85:1]]

(use data-structures debug sicp test)

(include "raise.scm")
(include "apply-generic-raise.scm")

;;; Packages

(define (install-scheme-number-projection-package)
  (define (->rational number)
    (make-rational (numerator number)
                   (denominator number)))
  (define (equ? x y) (= x y))
  (put '->rational '(real) ->rational)
  (put 'equ? '(scheme-number scheme-number) equ?))

(define (install-rational-projection-package)
  (define numer car)
  (define denom cdr)
  (define (->integer rational)
    (make-integer (/ (numer rational)
                     (denom rational))))
  (define (equ? n1 n2)
    (and (= (numer n1) (numer n2))
         (= (denom n1) (denom n2))))
  (put 'project '(rational) ->integer)
  (put 'equ? '(rational rational) equ?))

(define (install-complex-projection-package)
  (define (->real complex)
    (make-real (real-part complex)))
  ;; Not precise because of errors in conversion?
  (define (equ? c1 c2)
    (and (= (real-part c1) (real-part c2))
         (= (imag-part c1) (imag-part c2))))
  (put 'project '(complex) ->real)
  (put 'equ? '(complex complex) equ?))

(define (install-integer-projection-package)
  (put 'project '(integer) (constantly #f))
  (put 'equ? '(integer integer) equ?))

(define (install-real-projection-package)
  (put 'project '(real) ->rational)
  (put 'equ? '(real real) equ?))

;;; Generic project, equ?; drop

(define (project number)
  (apply-generic 'project number))

(define (equ? n1 n2)
  (apply-generic 'equ? n1 n2))

(define (drop number)
  (handle-exceptions exn
    number
    (let ((projection (project number)))
      (if projection
          (let ((promotion (raise projection)))
            (if (and promotion (equ? promotion number))
                (drop projection)
                number))
          number))))

(install-scheme-number-package)
(install-scheme-number-conversion-package)
(install-scheme-number-projection-package)
(install-rational-package)
(install-rational-conversion-package)
(install-rational-projection-package)
(install-complex-package)
(install-complex-conversion-package)
(install-complex-projection-package)

(install-integer-package)
(install-integer-projection-package)
(install-real-package)
(install-real-projection-package)

(let ((integer (make-integer 1))
      (rational (make-rational 1 1))
      (real (make-real 1))
      (complex (make-complex-from-real-imag 1 0))
      (irreducible-complex (make-complex-from-real-imag 1 2)))
  ;; These tests rely on the fact that we're dealing with lists as a
  ;; convential interface.
  (test-assert (not (project integer)))
  (test integer (project rational))
  (test rational (project real))
  (test real (project complex))
  (test integer (drop complex))
  (test irreducible-complex (drop irreducible-complex)))

;;; Simplifying apply-generic

(define (generic-number? number)
  (and (pair? number)
       (eq? (type-tag number) 'complex)))

(define drop? (make-parameter #t))

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (let ((result (apply proc (map contents args))))
            (if (drop?) (drop result) result))
          (cond ((= (length args) 1)
                 (let ((superarg (raise (car args))))
                   (if superarg
                       (apply-generic op superarg)
                       (error "No method for these types"
                              (list op type-tags)))))
                ((= (length args) 2)
                 (let ((type1 (car type-tags))
                       (type2 (cadr type-tags))
                       (a1 (car args))
                       (a2 (cadr args)))
                   (cond ((supertype? type1 type2)
                          (apply-generic op
                                         (raise-until-equitable a1 type2)
                                         a2))
                         ((supertype? type2 type1)
                          (apply-generic op a1 (raise-until-equitable a2
                                                                      type1)))
                         (else (error "No method for these types"
                                      (list op type-tags))))))
                (else (error "No method for these types" (list op type-tags))))))))

;;; Don't drop on raise: it defeats the purpose of raising.
(define (raise number)
  (parameterize ((drop? #f))
    (apply-generic 'raise number)))

(let ((integer (make-integer 2))
      (complex (make-complex-from-real-imag 1 0)))
  (test integer (add complex complex)))

;; 2\.85:1 ends here

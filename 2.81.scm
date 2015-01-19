#!/usr/bin/env chicken-scheme

(use debug sicp srfi-69 test)

(install-scheme-number-package)
(install-rational-package)
(install-complex-package)

(define coercion-table (make-parameter (make-hash-table)))

(define (put-coercion op type proc)
  (hash-table-set! (coercion-table) (cons op type) proc))

(define (get-coercion op type)
  (hash-table-ref/default (coercion-table) (cons op type) #f))

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car args))
                    (a2 (cadr args)))
                ;; Don't bother coercing to self.
                (if (eq? type1 type2)
                    (error "No method for these types"
                           (list op type-tags))
                    (let ((t1->t2 (get-coercion type1 type2))
                          (t2->t1 (get-coercion type2 type1)))
                      (cond (t1->t2
                             (apply-generic op (t1->t2 a1) a2))
                            (t2->t1
                             (apply-generic op a1 (t2->t1 a2)))
                            (else (error "No method for these types"
                                         (list op type-tags)))))))
              (error "No method for these types"
                     (list op type-tags)))))))

(define (scheme-number->complex n)
  (make-complex-from-real-imag (contents n) 0))

(put-coercion 'scheme-number
              'complex
              scheme-number->complex)

(define (scheme-number->scheme-number n) n)

(define (complex->complex z) z)

(put-coercion 'scheme-number
              'scheme-number
              scheme-number->scheme-number)

(put-coercion 'complex
              'complex
              complex->complex)

(define (exp x y)
  (apply-generic 'exp x y))

(put 'exp '(scheme-number scheme-number)
     (lambda (x y)
       (attach-tag 'scheme-number (expt x y))))

(let ((complex (make-complex-from-real-imag 2 0))
      (scheme-number (make-scheme-number 2)))
  (test '(scheme-number . 4) (exp scheme-number scheme-number))
  (test-error (exp complex complex))
  (test-error (exp scheme-number complex)))

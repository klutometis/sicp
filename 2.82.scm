#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.82][2\.82:1]]

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
          (let iter ((candidate-types type-tags))
            (if (null? candidate-types)
                (error "No method for these types"
                       (list op type-tags))
                (let* ((candidate-type (car candidate-types))
                       (coercions (map (lambda (type)
                                         ;; Need to distinguish
                                         ;; between no coercion and
                                         ;; self-coercion.
                                         (if (eq? type candidate-type)
                                             identity
                                             (get-coercion type candidate-type)))
                                       type-tags)))
                  ;; We should have a coercion for every type,
                  ;; excluding self-coercions.
                  (if (and (every identity coercions)
                           (pair? (delete identity coercions)))
                      (let ((args (map (lambda (coercion arg) (coercion arg))
                                       coercions args)))
                        (apply apply-generic (cons op args)))
                      (iter (cdr candidate-types))))))))))

(define (scheme-number->complex n)
  (make-complex-from-real-imag (contents n) 0))

(put-coercion 'scheme-number
              'complex
              scheme-number->complex)

(define (exp x y)
  (apply-generic 'exp x y))

(put 'exp '(scheme-number scheme-number)
     (lambda (x y)
       (attach-tag 'scheme-number (expt x y))))

(let ((complex (make-complex-from-real-imag 2 0))
      (scheme-number (make-scheme-number 2)))
  (test '(complex rectangular 4 . 0) (add scheme-number complex))
  (test-error (exp scheme-number complex)))

;; 2\.82:1 ends here

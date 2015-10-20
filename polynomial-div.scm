#!/usr/bin/env chicken-scheme
(define (install-polynomial-div-package)
  ;; Copied, unfortunately, from the polynomial package
  (define (make-poly variable term-list) (cons variable term-list))
  (define (variable p) (car p))
  (define (term-list p) (cdr p))
  (define variable? symbol?)

  (define (same-variable? v1 v2)
    (and (variable? v1) (variable? v2) (eq? v1 v2)))
  (define (adjoin-term term term-list)
    (if (=zero? (coeff term))
        term-list
        (cons term term-list)))
  (define (the-empty-termlist) '())
  (define (first-term term-list) (car term-list))
  (define (rest-terms term-list) (cdr term-list))
  (define (empty-termlist? term-list) (null? term-list))
  (define (make-term order coeff) (list order coeff))
  (define (order term) (car term))
  (define (coeff term) (cadr term))
  (define (tag p) (attach-tag 'polynomial p))

  ;; Division starts here.
  (define (div-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
        (let ((variable (variable p1)))
          (let ((result (div-terms variable
                                   (term-list p1)
                                   (term-list p2))))
            (list (make-polynomial variable (car result))
                  (make-polynomial variable (cadr result)))))
        (error "Polys not in same var: DIV-POLY" (list p1 p2))))

  (define (div-terms variable L1 L2)
    (cond ((every =zero? (map coeff L1))
           (list (list (make-term 0 0)) (list (make-term 0 0))))
          ((empty-termlist? L1)
           (list (the-empty-termlist) (the-empty-termlist)))
          (else
           (let ((t1 (first-term L1))
                 (t2 (first-term L2)))
             (if (> (order t2) (order t1))
                 (list (the-empty-termlist) L1)
                 (let ((new-c (div (coeff t1) (coeff t2)))
                       (new-o (- (order t1) (order t2))))
                   (let ((new-term (make-term new-o new-c)))
                     (let ((result (make-polynomial variable (list new-term)))
                           (dividend (make-polynomial variable L1))
                           (divisor (make-polynomial variable L2)))
                       (let ((rest-of-result
                              (div-terms variable
                                         (term-list
                                          (contents
                                           (sub dividend (mul result divisor))))
                                         L2)))
                         (list (adjoin-term new-term (car rest-of-result))
                               (cadr rest-of-result)))))))))))

  (put 'div '(polynomial polynomial) div-poly))

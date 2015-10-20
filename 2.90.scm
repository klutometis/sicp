#!/usr/bin/env chicken-scheme
(use sicp test)

(include "polynomial.scm")

(define (install-term-package)
  (define (tag object) (attach-tag 'term object))
  (define (make order coeff) (list order coeff))
  (define order car)
  (define coeff cadr)
  (put 'make-term 'term (lambda (order coeff)
                          (tag (list order coeff))))
  (put 'order '(term) order)
  (put 'coeff '(term) coeff))

(define (make-term order coeff)
  ((get 'make-term 'term) order coeff))

(define (order term)
  (apply-generic 'order term))

(define (coeff term)
  (apply-generic 'coeff term))

(define (install-sparse-term-package)
  (define (tag object) (attach-tag 'sparse object))
  (define (first-term term-list) (apply make-term (car term-list)))
  (define (adjoin-term term term-list)
    (let ((term (apply make-term term)))
      (if (=zero? (coeff term))
          (tag term-list)
          (tag (cons (contents term) term-list)))))
  (put 'make-terms 'sparse
       (lambda (terms)
         (attach-tag 'sparse terms)))
  (put 'first-term '(sparse) first-term)
  (put 'adjoin-term '(term sparse) adjoin-term)
  (put 'empty-termlist? '(sparse) null?)
  (put 'rest-terms '(sparse) (compose tag cdr)))

(define (install-dense-term-package)
  (define (tag object) (attach-tag 'dense object))
  (define (first-term term-list)
    (make-term (- (length term-list) 1)
               (car term-list)))
  (define (adjoin-term term term-list)
    (let ((term (apply make-term term)))
      (if (= (length term-list) (order term))
          (tag (cons (coeff term) term-list))
          (adjoin-term (contents term)
                       (cons 0 term-list)))))
  (put 'make-terms 'dense
       (lambda (terms) (tag terms)))
  (put 'first-term '(dense) first-term)
  (put 'adjoin-term '(term dense) adjoin-term)
  (put 'empty-termlist? '(dense) null?)
  (put 'rest-terms '(dense) (compose tag cdr)))

(define (first-term term-list)
  (apply-generic 'first-term term-list))

(define (adjoin-term term term-list)
  (apply-generic 'adjoin-term term term-list))

(define (empty-termlist? terms)
  (apply-generic 'empty-termlist? terms))

(define (rest-terms terms)
  (apply-generic 'rest-terms terms))

(define (make-sparse-terms terms)
  ((get 'make-terms 'sparse) terms))

(define (make-dense-terms terms)
  ((get 'make-terms 'dense) terms))

(define (install-polynomial-package)
  ;; internal procedures
  ;; representation of poly
  (define (make-poly variable term-list)
    (cons variable term-list))
  (define (variable p) (car p))
  (define (term-list p) (cdr p))
  (define variable? symbol?)

  (define (same-variable? v1 v2)
    (and (variable? v1) (variable? v2) (eq? v1 v2)))
  (define (the-empty-termlist) '())

  (define (add-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
        (make-poly (variable p1)
                   (add-terms (term-list p1) (term-list p2)))
        (error "Polys not in same var: ADD-POLY" (list p1 p2))))
  (define (add-terms L1 L2)
    (cond ((empty-termlist? L1) L2)
          ((empty-termlist? L2) L1)
          (else
           (let ((t1 (first-term L1))
                 (t2 (first-term L2)))
             (cond ((> (order t1) (order t2))
                    (adjoin-term
                     t1 (add-terms (rest-terms L1) L2)))
                   ((< (order t1) (order t2))
                    (adjoin-term
                     t2 (add-terms L1 (rest-terms L2))))
                   (else
                    (adjoin-term
                     (make-term (order t1)
                                (add (coeff t1) (coeff t2)))
                     (add-terms (rest-terms L1)
                                (rest-terms L2)))))))))
  (define (mul-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
        (make-poly (variable p1)
                   (mul-terms (term-list p1) (term-list p2)))
        (error "Polys not in same var: MUL-POLY" (list p1 p2))))
  (define (mul-terms L1 L2)
    (if (empty-termlist? L1)
        (the-empty-termlist)
        (add-terms (mul-term-by-all-terms (first-term L1) L2)
                   (mul-terms (rest-terms L1) L2))))
  (define (mul-term-by-all-terms t1 L)
    (if (empty-termlist? L)
        (the-empty-termlist)
        (let ((t2 (first-term L)))
          (adjoin-term
           (make-term (+ (order t1) (order t2))
                      (mul (coeff t1) (coeff t2)))
           (mul-term-by-all-terms t1 (rest-terms L))))))
  (define (poly-=zero? p)
    (let ((term-list (term-list p)))
      (or (empty-termlist? term-list)
          (every =zero? (map coeff term-list)))))
  ;; interface to rest of the system
  (define (tag p) (attach-tag 'polynomial p))
  (put 'add '(polynomial polynomial)
       (lambda (p1 p2) (tag (add-poly p1 p2))))
  (put 'mul '(polynomial polynomial)
       (lambda (p1 p2) (tag (mul-poly p1 p2))))
  (put 'make 'polynomial
       (lambda (var terms) (tag (make-poly var terms))))
  (put '=zero? '(polynomial) poly-=zero?)
  'done)

(define (make-sparse-polynomial var terms)
  ((get 'make 'polynomial) var (make-sparse-terms terms)))

(define (make-dense-polynomial var terms)
  ((get 'make 'polynomial) var (make-dense-terms terms)))

(define (=zero? n) (apply-generic '=zero? n))

(install-zero-package)
(install-scheme-number-package)
(install-rational-package)
(install-complex-package)
(install-term-package)
(install-sparse-term-package)
(install-dense-term-package)
(install-polynomial-package)

(let* ((p1 (make-sparse-polynomial 'x '((2 1))))
       (p2 (make-dense-polynomial 'x `(,p1 0 0))))
  (test '(polynomial x dense (polynomial x sparse (2 2)) 0 0)
        (add p2 p2)))

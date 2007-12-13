;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "same-variable?.scm")
(load "variable?.scm")
(load "tag-sparse.scm")
(load "put.scm")
(load "=zero?.scm")
(load "add.scm")
(load "mul.scm")
(load "make-term.scm")
(load "order.scm")
(load "coeff.scm")
(load "negate.scm")
(load "term-list.scm")
(load "put-irreducible.scm")
(load "tag-dense.scm")
(load "exp.scm")

(define (install-sparse-polynomial-package)
  (define (make-poly variable term-list)
    (cons variable term-list))
  (define (variable p) (car p))
  (define (sparse-term-list p) (cdr p))
  (define (add-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
        (make-poly (variable p1)
                   (add-terms (sparse-term-list p1)
                              (sparse-term-list p2)))
        (error "Polys not in same var -- ADD-POLY"
              (list p1 p2))))

  (define (mul-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
        (make-poly (variable p1)
                   (mul-terms (sparse-term-list p1)
                              (sparse-term-list p2)))
        (error "Polys not in same var -- MUL-POLY"
              (list p1 p2))))

  (define (add-terms L1 L2)
    (cond ((empty-termlist? L1) L2)
          ((empty-termlist? L2) L1)
          (else
           (let ((t1 (first-term L1)) (t2 (first-term L2)))
             (cond ((> (order t1) (order t2))
                    (adjoin-term
                     t1 (add-terms (rest-terms L1) L2)))
                   ((< (order t1) (order t2))
                    (adjoin-term t2 (add-terms L1 (rest-terms L2))))
                   (else
                    (adjoin-term
                     (make-term (order t1)
                                (add (coeff t1) (coeff t2)))
                     (add-terms (rest-terms L1)
                                (rest-terms L2)))))))))

  ;;(trace add-terms)

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
           (make-term (add (order t1) (order t2))
                      (mul (coeff t1) (coeff t2)))
           (mul-term-by-all-terms t1 (rest-terms L))))))

  (define (div-all-terms-by-term L t2)
    (if (empty-termlist? L)
        (the-empty-termlist)
        (let ((t1 (first-term L)))
          (adjoin-term
           (make-term (sub (order t1) (order t2))
                      (div (coeff t1) (coeff t2)))
           (div-all-terms-by-term (rest-terms L) t2)))))

  (define (negate-poly p)
    (make-poly (variable p) (negate-terms (sparse-term-list p))))

  (define (negate-terms terms)
    (if (empty-termlist? terms)
        (the-empty-termlist)
        (let ((term (first-term terms)))
          (adjoin-term (make-term (order term) (negate (coeff term)))
                       (negate-terms (rest-terms terms))))))

  (define (sub-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
        (make-poly (variable p1) (sub-terms (sparse-term-list p1) (sparse-term-list p2)))
        (error "Polys not in same var -- SUB-POLY"
               (list p1 p2))))

  (define (sub-terms L1 L2)
    (add-terms L1 (negate-terms L2)))

  (define (adjoin-term term term-list)
    (if (=zero? (coeff term))
        term-list
        (cons term term-list)))

  (define (div-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
        (make-poly (variable p1) (div-terms (sparse-term-list p1) (sparse-term-list p2)))
        (error "Polys not in same var -- DIV-POLY"
               (list p1 p2))))

  (define (div-terms L1 L2)
    (if (empty-termlist? L1)
        (list (the-empty-termlist) (the-empty-termlist))
        (let ((t1 (first-term L1))
              (t2 (first-term L2)))
          (if (> (order t2) (order t1))
              (list (the-empty-termlist) L1)
              (let* ((new-c (div (coeff t1) (coeff t2)))
                     (new-o (sub (order t1) (order t2)))
                     (new-term (make-term new-o new-c))
                     (subtrahend (mul-terms (list new-term) L2))
                     (rest-of-result (div-terms (sub-terms L1 subtrahend) L2)))
                (append (list (append (list new-term) (car (except-last-pair rest-of-result))))
                        (last-pair rest-of-result)))))))

  (define (gcd-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
        (make-poly (variable p1) (gcd-terms (sparse-term-list p1) (sparse-term-list p2)))
        (error "Polys not in same var -- SUB-POLY"
               (list p1 p2))))

  (define (remainder-terms L1 L2)
    (car (last-pair (div-terms L1 L2))))

  (define (integerizing-factor L1 L2)
    (let* ((c (coeff (first-term L2)))
           (o1 (order (first-term L1)))
           (o2 (order (first-term L2))))
      (exp c (- (+ 1 o1) o2))))

  (define (pseudoremainder-terms L1 L2)
    (car (last-pair (div-terms (mul-term-by-all-terms
                                (make-term 0 (integerizing-factor L1 L2))
                                L1) L2))))

  ;;(trace pseudoremainder-terms)

  ;;(trace integerizing-factor)

  ;;(trace remainder-terms)

  ;;(trace div-terms)

  (define (reduce-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
        (map (lambda (poly) (tag (make-poly (variable p1) poly)))
             (reduce-terms (sparse-term-list p1)
                           (sparse-term-list p2)))
        (error "Polys not in same var -- REDUCE-POLY"
               (list p1 p2))))

  (define (reduce-terms n d)
    (let* ((gcd (gcd-terms n d))
           (base (coeff (first-term gcd)))
           (order-n (order (first-term n)))
           (order-d (order (first-term d)))
           (o1 (max order-n order-d))
           (o2 (order (first-term gcd)))
           (factor (exp base (- (+ 1 o1) o2)))
           (terms (list n d)))
      (map (lambda (term) (car (div-terms
                                (mul-term-by-all-terms (make-term 0 factor) term)
                                gcd)))
           terms)))

  (define (gcd-coeffs terms)
    (div-all-terms-by-term terms (make-term 0 (fold-right gcd 0 (map coeff terms)))))
    
  (define (gcd-terms a b)
    (if (empty-termlist? b)
        a
        (gcd-terms b
                   ;;(remainder-terms a b)
                   (gcd-coeffs (pseudoremainder-terms a b))
                   )))

  ;;(trace gcd-terms)

  (define (equ? p1 p2)
    (equal? (sparse-term-list p1) (sparse-term-list p2)))

  (define (the-empty-termlist) '())
  (define (first-term term-list) (car term-list))
  (define (rest-terms term-list) (cdr term-list))
  (define (empty-termlist? term-list) (null? term-list))

  (define (tag p) (tag-sparse p))
  
  (put 'equ? '(sparse sparse)
       equ?)
  (put 'add '(sparse sparse)
       (lambda (p1 p2) (tag (add-poly p1 p2))))
  (put 'mul '(sparse sparse)
       (lambda (p1 p2) (tag (mul-poly p1 p2))))
  (put 'div '(sparse sparse)
       (lambda (p1 p2) (tag (div-poly p1 p2))))
  (put 'negate '(sparse)
       (lambda (p) (tag (negate-poly p))))
  (put 'sub '(sparse sparse)
       (lambda (p1 p2) (tag (sub-poly p1 p2))))
  (put 'make-sparse 'sparse
       (lambda (var terms) (tag (make-poly var terms))))
  (put '=zero? '(sparse)
        (lambda (p)
         (let ((terms (sparse-term-list p)))
           (if (empty-termlist? terms)
               true
               (fold-right (lambda (this-coeff coeff-zero?)
                             (and (=zero? this-coeff) coeff-zero?))
                           true
                           (map coeff terms))))))
                             
  (put 'term-list '(sparse) sparse-term-list)

  (put 'greatest-common-divisor '(sparse sparse) (lambda (p1 p2)
       (tag (gcd-poly p1 p2))))

  ;; reduce-poly tags
  (put 'reduce '(sparse sparse) reduce-poly)

;;   (define (complex->sparse z)
;;     (put-irreducible 'complex->sparse)
;;     (tag (make-poly '() (list (make-term 0 z)))))
;;   (put 'raise '(complex) complex->sparse)
;;   (put 'complex->sparse '(complex) complex->sparse)

;;   (define (sparse->complex p)
;;     (coeff (car (sparse-term-list p))))
;;   (put 'project '(sparse) sparse->complex)

  (define (dense->sparse p)
    (put-irreducible 'dense->sparse)
    (tag (make-poly (variable p) (term-list (tag-dense p)))))
  (put 'raise '(dense) dense->sparse)
  (put 'dense->sparse '(dense) dense->sparse)
  ;;(trace dense->sparse)
  'done)

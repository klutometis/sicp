#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*3.40][3\.40:1]]

(use combinatorics srfi-69 srfi-95 vector-lib)

(define (operations-set! operations
                         combination
                         access
                         multiply
                         set!)
  (let iter ((access? #t)
             (combination combination))
    (unless (null? combination)
      (let ((operation (car combination)))
        (cond (access?
               (vector-set! operations operation access))
              ((null? (cdr combination))
               (vector-set! operations operation set!))
              (else
               (vector-set! operations operation multiply))))
      (iter #f (cdr combination)))))

(define (combination->operations combinations combination)
  (let ((operations (make-vector 7))
        (anti-combination (lset-difference = combinations combination)))
    (operations-set! operations
                     (sort combination <)
                     'p1-access
                     'p1-multiply
                     'p1-set!)
    (operations-set! operations
                     (sort anti-combination <)
                     'p2-access
                     'p2-multiply
                     'p2-set!)
    operations))

(define (apply-operations x operations)
  (let ((x1 #f)
        (x2 #f))
    (vector-for-each
     (lambda (i operation)
       (case operation
         ((p1-access) (set! x1 x))
         ((p1-multiply) (set! x1 (* x1 x)))
         ((p1-set!) (set! x x1))
         ((p2-access) (set! x2 x))
         ((p2-multiply) (set! x2 (* x2 x)))
         ((p2-set!) (set! x x2))
         (else (error "Unknown operation"))))
     operations))
  x)

(let ((x->operations (make-hash-table))
      (combinations (iota 7)))
  (unordered-subset-for-each
   (lambda (combination)
     (let ((x 10))
       (let* ((operations
               (combination->operations combinations combination))
              (x (apply-operations x operations)))
         (hash-table-update!/default x->operations
                                     x
                                     (lambda (x-operations)
                                       (cons operations x-operations))
                                     '()))))
   combinations
   3)
  (sort (hash-table->alist x->operations) < car))

;; 3\.40:1 ends here

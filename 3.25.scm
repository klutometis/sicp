#!/usr/bin/env chicken-scheme
(use test)

(include "table.scm")

(define no-value (cons #f #f))
(define (no-value? object) (eq? no-value object))

(define make-table-or-value cons)
(define table-or-value-table car)
(define table-or-value-table-set! set-car!)
(define table-or-value-value cdr)
(define table-or-value-value-set! set-cdr!)

(define (make-deep-table)
  (let ((table (make-table)))
    (lambda (message)
      (case message
        ((lookup)
         (lambda (keys)
           (let iter ((keys keys)
                      (table table))
             (let* ((key (car keys))
                    (subtable-or-value ((table 'lookup) key)))
               (and subtable-or-value
                    (if (null? (cdr keys)) ; Terminal case
                        (table-or-value-value subtable-or-value)
                        (iter (cdr keys)
                              (table-or-value-table subtable-or-value))))))))
        ((insert!)
         (lambda (keys value)
           (let iter ((keys keys)
                      (table table))
             (let* ((key (car keys))
                    (subtable-or-value ((table 'lookup) key)))
               (if (null? (cdr keys))   ; Terminal case
                   (if subtable-or-value
                       (table-or-value-value-set! subtable-or-value value)
                       ((table 'insert!)
                        key
                        (make-table-or-value (make-table) value)))
                   (if subtable-or-value
                       (iter (cdr keys)
                             (table-or-value-table subtable-or-value))
                       (let ((subtable-or-value
                              (make-table-or-value (make-table) no-value)))
                         ((table 'insert!)
                          key
                          subtable-or-value)
                         (iter (cdr keys)
                               (table-or-value-table subtable-or-value)))))))))
        ((table) (table 'table))))))

(let ((table (make-deep-table)))
  ((table 'insert!) '(a) 1)
  ((table 'insert!) '(a b) 2)
  (test 1 ((table 'lookup) '(a)))
  (test 2 ((table 'lookup) '(a b))))

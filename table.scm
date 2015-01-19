#!/usr/bin/env chicken-scheme

(define make-table
  (case-lambda
   (() (make-table equal?))
   ((same-key?)
    (let ((table (list '*table*)))
      (define (assoc key records)
        (cond ((null? records) #f)
              ((same-key? key (caar records)) (car records))
              (else (assoc key (cdr records)))))
      (lambda (message)
        (case message
          ((lookup)
           (lambda (key)
             (let ((record (assoc key (cdr table))))
               (and record (cdr record)))))
          ((insert!)
           (lambda (key value)
             (let ((record (assoc key (cdr table))))
               (if record
                   (set-cdr! record value)
                   (set-cdr! table
                             (cons (cons key value)
                                   (cdr table)))))))
          ((table) table)))))))

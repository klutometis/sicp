#!/usr/bin/env chicken-scheme
(use debug sicp-streams sicp-eval-logic test)

(define (simple-stream-flatmap proc s)
  (simple-flatten (stream-map proc s)))

(define (simple-flatten stream)
  (stream-map stream-car
              (stream-filter (lambda (stream)
                               (not (stream-null? stream))) stream)))

(define (negate operands frame-stream)
  (simple-stream-flatmap
   (lambda (frame)
     (if (stream-null?
          (qeval (negated-query operands)
                 (singleton-stream frame)))
         (singleton-stream frame)
         the-empty-stream))
   frame-stream))

(define (lisp-value call frame-stream)
  (simple-stream-flatmap
   (lambda (frame)
     (if (execute
          (instantiate
           call
           frame
           (lambda (v f)
             (error "Unknown pat var: LISP-VALUE" v))))
         (singleton-stream frame)
         the-empty-stream))
   frame-stream))

(define (find-assertions pattern frame)
  (simple-stream-flatmap
   (lambda (datum)
     (check-an-assertion datum pattern frame))
   (fetch-assertions pattern frame)))

(with-microshaft-database
 (lambda ()
   (test
    "Salary less than Ben"
    '((and (salary (Bitdiddle Ben) 60000)
           (salary (Aull DeWitt) 25000)
           (lisp-value < 25000 60000))
      (and (salary (Bitdiddle Ben) 60000)
           (salary (Cratchet Robert) 18000)
           (lisp-value < 18000 60000))
      (and (salary (Bitdiddle Ben) 60000)
           (salary (Reasoner Louis) 30000)
           (lisp-value < 30000 60000))
      (and (salary (Bitdiddle Ben) 60000)
           (salary (Tweakit Lem E) 25000)
           (lisp-value < 25000 60000))
      (and (salary (Bitdiddle Ben) 60000)
           (salary (Fect Cy D) 35000)
           (lisp-value < 35000 60000))
      (and (salary (Bitdiddle Ben) 60000)
           (salary (Hacker Alyssa P) 40000)
           (lisp-value < 40000 60000)))
    (qeval* '(and (salary (Bitdiddle Ben) ?ben-salary)
                  (salary ?name ?salary)
                  (lisp-value < ?salary ?ben-salary))))))

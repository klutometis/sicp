(load "query-context.scm")
(load "query/simple-flatten.scm")
(load "query/simple-stream-flatmap.scm")

;(trace check-an-assertion)

(define queries
  '(
    (and (job ?x ?y)
         (not (job ?x (computer . ?subdivision))))
    (and (salary ?x ?salary)
         (lisp-value (lambda (salary) (> salary 40000)) ?salary))
    ))

(define (run-queries data-base queries)
  (initialize-data-base data-base)
  (map query queries))

(define book-flatten (run-queries microshaft-data-base queries))

(define (negate operands frame-stream)
  (simple-stream-flatmap
   (lambda (frame)
     (if (stream-null? (qeval (negated-query operands)
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
             (error "Unknown pat var -- LISP-VALUE" v))))
         (singleton-stream frame)
         the-empty-stream))
   frame-stream))

(define (find-assertions pattern frame)
  (simple-stream-flatmap (lambda (datum)
                    (check-an-assertion datum pattern frame))
                  (fetch-assertions pattern frame)))

(define simple-flatten (run-queries microshaft-data-base queries))

(test
 "book's flatten and simple-flatten produce identical results for nots and lisp-values (in certain cases)"
 book-flatten
 simple-flatten
 'equal? equal?)

;; b. TODO

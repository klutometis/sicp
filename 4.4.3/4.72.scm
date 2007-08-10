(load "context.scm")
(load "append-to-form.scm")

(define queries
  '(
    (assert! (rule (zip ?l1 ?l2 ?zipped)
                   (zip ?l1 ?l2 () ?zipped)))
    (assert! (rule (zip () () ?zipped ?zipped)))
    (assert! (rule (zip (?h1 . ?t1) (?h2 . ?t2) ?accumulated ?zipped)
                   (zip ?t1 ?t2 (?h1 . (?h2 . ?accumulated)) ?zipped)))
;    (zip (1 2 3) ?x (3 3 2 2 1 1))
    (zip (1 1 1 1 1 1 1 1) (2 2 2 2 2 2 2 2) ?x)
;    (zip ((1 2) (2 3)) () ())
    ))

(initialize-data-base '())
(install append-to-form)

(map query queries)

(define (flatten-stream stream)
  (if (stream-null? stream)
      the-empty-stream
      (stream-append-delayed
       (stream-car stream)
       (delay (flatten-stream (stream-cdr stream))))))


(define (disjoin disjuncts frame-stream)
  (if (empty-disjunction? disjuncts)
      the-empty-stream
      (stream-append-delayed
       (qeval (first-disjunct disjuncts) frame-stream)
       (delay (disjoin (rest-disjuncts disjuncts)
                       frame-stream)))))

(initialize-data-base '())
(install append-to-form)

(map query queries)

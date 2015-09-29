#!/usr/bin/env chicken-scheme

(use sicp sicp-streams sicp-eval-logic test)

(with-empty-database
 (lambda ()
   (qeval* '(assert! (rule (married ?x ?y)
                           (married ?y ?x))))
   (qeval* '(assert! (married Minnie Mickey)))
   (test "Recursive rule nevertheless prints results when delayed."
         '((married Mickey Minnie)
           (married Mickey Minnie)
           (married Mickey Minnie)
           (married Mickey Minnie)
           (married Mickey Minnie))
         (qeval* '(married Mickey ?who) 5))))

(define (simple-query
         query-pattern frame-stream)
  (stream-flatmap
   (lambda (frame)
     (stream-append
      (find-assertions query-pattern frame)
      (apply-rules query-pattern frame)))
   frame-stream))

(define (disjoin disjuncts frame-stream)
  (if (empty-disjunction? disjuncts)
      the-empty-stream
      (interleave
       (qeval (first-disjunct disjuncts)
              frame-stream)
       (disjoin (rest-disjuncts disjuncts)
                frame-stream))))

(with-empty-database
    (lambda ()
      (qeval* '(assert! (rule (married ?x ?y)
                              (married ?y ?x))))
      (qeval* '(assert! (married Minnie Mickey)))
      (test-assert
       "The undelayed disjoin never actually returns."
       (not (terminates? (lambda () (qeval* '(married Mickey ?who) 5)))))))

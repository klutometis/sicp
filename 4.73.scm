#!/usr/bin/env chicken-scheme
(use debug sicp-streams sicp-eval-logic test)

;;; Thanks, Jonathan Chen:
;;; <https://github.com/ypeels/sicp/blob/master/exercises/4.73-delay-in-flatten-stream.scm>.
(define (test-recurse)
  (with-microshaft-database
   (lambda ()
     (qeval* '(assert! (rule (infinite-loop) (infinite-loop))))
     (qeval* '(assert! (rule (job (Bitdiddle Ben) ?what) (infinite-loop))))
     (qeval* '(and (supervisor ?slave ?master) (job ?master ?what)) 6))))

(define (flatten-stream stream)
  (if (stream-null? stream)
      the-empty-stream
      (interleave-delayed
       (stream-car stream)
       (delay (flatten-stream (stream-cdr stream))))))

(test "Flatten-stream with delay gives 6 results."
      '((and (supervisor (Aull DeWitt) (Warbucks Oliver))
             (job (Warbucks Oliver) (administration big wheel)))
        (and (supervisor (Cratchet Robert) (Scrooge Eben))
             (job (Scrooge Eben) (accounting chief accountant)))
        (and (supervisor (Scrooge Eben) (Warbucks Oliver))
             (job (Warbucks Oliver) (administration big wheel)))
        (and (supervisor (Bitdiddle Ben) (Warbucks Oliver))
             (job (Warbucks Oliver) (administration big wheel)))
        (and (supervisor (Reasoner Louis) (Hacker Alyssa P))
             (job (Hacker Alyssa P) (computer programmer)))
        (and (supervisor (Tweakit Lem E) (Bitdiddle Ben))
             (job (Bitdiddle Ben) (computer wizard))))
      (test-recurse))

(define (flatten-stream stream)
  (if (stream-null? stream)
      the-empty-stream
      (interleave (stream-car stream)
                  (flatten-stream
                   (stream-cdr stream)))))

(test-assert "Flatten-stream without delay doesn't."
             (not (terminates? test-recurse)))

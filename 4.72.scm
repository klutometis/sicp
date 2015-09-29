#!/usr/bin/env chicken-scheme

(use sicp-streams sicp-eval-logic test)

(with-empty-database
 (lambda ()
   (qeval* '(assert! (rule (shuffle () ?b ?b))))
   (qeval* '(assert! (rule (shuffle (?h . ?a) ?b (?h . ?s))
                           (shuffle ?b ?a ?s))))
   (qeval* '(shuffle (1 2 3) (a b c) ?shuffled))))

;; (define (disjoin disjuncts frame-stream)
;;   (if (empty-disjunction? disjuncts)
;;       the-empty-stream
;;       (interleave-delayed
;;        (qeval (first-disjunct disjuncts)
;;               frame-stream)
;;        (delay (disjoin
;;                (rest-disjuncts disjuncts)
;;                frame-stream)))))

;; (define (flatten-stream stream)
;;   (if (stream-null? stream)
;;       the-empty-stream
;;       (interleave-delayed
;;        (stream-car stream)
;;        (delay (flatten-stream (stream-cdr stream))))))

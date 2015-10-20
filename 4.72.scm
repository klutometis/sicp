#!/usr/bin/env chicken-scheme
(use sicp-streams sicp-eval-logic test)

(define (disjoin disjuncts frame-stream)
  (if (empty-disjunction? disjuncts)
      the-empty-stream
      (interleave-delayed
       (qeval (first-disjunct disjuncts)
              frame-stream)
       (delay (disjoin
               (rest-disjuncts disjuncts)
               frame-stream)))))

(define (flatten-stream stream)
  (if (stream-null? stream)
      the-empty-stream
      (interleave-delayed
       (stream-car stream)
       (delay (flatten-stream (stream-cdr stream))))))

(with-empty-database
 (lambda ()
   (qeval* '(assert! (rule (perm ?list (?h . ?perm))
                           (and (delete ?h ?list ?rest)
                                (perm ?rest ?perm)))))
   (qeval* '(assert! (rule (perm () ()))))
   (qeval* '(assert! (rule (delete ?x (?x . ?t) ?t))))
   (qeval* '(assert! (rule (delete ?x (?h . ?t) (?h . ?nt))
                           (delete ?x ?t ?nt))))
   (test
    "Permutations with interleaving"
    '((perm (1 2 3) (3 2 1))
      (perm (1 2 3) (1 3 2))
      (perm (1 2 3) (3 1 2))
      (perm (1 2 3) (2 3 1))
      (perm (1 2 3) (1 2 3))
      (perm (1 2 3) (2 1 3)))
    (qeval* '(perm (1 2 3) ?perm)))))

(define (disjoin disjuncts frame-stream)
  (if (empty-disjunction? disjuncts)
      the-empty-stream
      (stream-append-delayed
       (qeval (first-disjunct disjuncts)
              frame-stream)
       (delay (disjoin
               (rest-disjuncts disjuncts)
               frame-stream)))))

(define (flatten-stream stream)
  (if (stream-null? stream)
      the-empty-stream
      (stream-append-delayed
       (stream-car stream)
       (delay (flatten-stream (stream-cdr stream))))))

(with-empty-database
 (lambda ()
   (qeval* '(assert! (rule (perm ?list (?h . ?perm))
                           (and (delete ?h ?list ?rest)
                                (perm ?rest ?perm)))))
   (qeval* '(assert! (rule (perm () ()))))
   (qeval* '(assert! (rule (delete ?x (?x . ?t) ?t))))
   (qeval* '(assert! (rule (delete ?x (?h . ?t) (?h . ?nt))
                           (delete ?x ?t ?nt))))
   (test
    "Permutations with append"
    '((perm (1 2 3) (3 2 1))
      (perm (1 2 3) (3 1 2))
      (perm (1 2 3) (2 3 1))
      (perm (1 2 3) (2 1 3))
      (perm (1 2 3) (1 3 2))
      (perm (1 2 3) (1 2 3)))
    (qeval* '(perm (1 2 3) ?perm)))))

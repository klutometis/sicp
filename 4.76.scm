#!/usr/bin/env chicken-scheme
(use sicp sicp-eval-logic sicp-streams test)

(define (failed? obj)
  (eq? obj 'failed))

(define (maybe-failure obj)
  (and (failed? obj) obj))

(define (succeeded? obj)
  (not (failed? obj)))

(define (merge-frames f1 f2)
  (if (null? f1)
      f2
      (let ((binding (car f1)))
        (let ((var (binding-variable binding))
              (val (binding-value binding)))
          (let ((extension (extend-if-possible var val f2)))
            (or (maybe-failure extension)
                (merge-frames (cdr f1) extension)))))))

(define (merge-frame-streams s1 s2)
  the-empty-stream
  (stream-flatmap
   (lambda (f1)
     (stream-filter
      succeeded?
      (stream-map
       (lambda (f2)
         (merge-frames f1 f2))
       s2)))
   s1))

(define (conjoin conjuncts frame-stream)
  (if (empty-conjunction? conjuncts)
      frame-stream
      (merge-frame-streams
       (qeval (first-conjunct conjuncts) frame-stream)
       (conjoin (rest-conjuncts conjuncts) frame-stream))))

(with-microshaft-database
 (lambda ()
   (test "Conjunction in n^2/k^2"
         '((and (supervisor (Fect Cy D) (Bitdiddle Ben))
                (job (Fect Cy D) (computer programmer)))
           (and (supervisor (Hacker Alyssa P) (Bitdiddle Ben))
                (job (Hacker Alyssa P) (computer programmer))))
         (qeval* '(and (supervisor ?x ?y) (job ?x (computer programmer)))))))

#!/usr/bin/env chicken-scheme

(define (filtered-accumulate predicate?
                             combiner
                             null-value
                             term
                             a
                             next
                             b)
  (if (> a b)
      null-value
      (let ((term-a (term a)))
        (if (predicate? term-a)
            (combiner term-a
                      (filtered-accumulate predicate?
                                           combiner
                                           null-value
                                           term
                                           (next a)
                                           next
                                           b))
            (filtered-accumulate predicate?
                                 combiner
                                 null-value
                                 term
                                 (next a)
                                 next
                                 b)))))

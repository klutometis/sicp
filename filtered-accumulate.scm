#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*1.33][1\.33:1]]

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

;; 1\.33:1 ends here

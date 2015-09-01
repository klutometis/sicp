#!/usr/bin/env chicken-scheme

(use sicp-eval-logic test)

(with-microshaft-database
 (lambda ()
   (qeval* '(assert! (rule (outranked-by ?staff-person ?boss)
                           (or (supervisor ?staff-person ?boss)
                               (and (outranked-by ?middle-manager ?boss)
                                    (supervisor ?staff-person ?middle-manager))))))
   (test-assert
    "The new outranked has pathological recursion."
    (not (terminates? (lambda () (qeval* '(outranked-by (Bitdiddle Ben) ?who))))))))

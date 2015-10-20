#!/usr/bin/env chicken-scheme
(use sicp sicp-eval-logic test)

(with-empty-database
 (lambda ()
   (qeval* '(assert! (rule (last-pair (?x) (?x)))))
   (qeval* '(assert! (rule (last-pair (?x . ?y) ?z)
                           (last-pair ?y ?z))))
   (test "Last pair of (3)"
         '((last-pair (3) (3)))
         (qeval* '(last-pair (3) ?x)))
   (test "Last pair of (1 2 3)"
         '((last-pair (1 2 3) (3)))
         (qeval* '(last-pair (1 2 3) ?x)))
   (test "Last pair of (2 ?) against (3)"
         '((last-pair (2 3) (3)))
         (qeval* '(last-pair (2 ?x) (3))))
   (test-assert "Last pair of ?x against (3) never terminates."
                (not (terminates? (lambda () (qeval* '(last-pair ?x (3)))))))))

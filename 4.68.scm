#!/usr/bin/env chicken-scheme

(use sicp-eval-logic test)

(with-empty-database
 (lambda ()
   (qeval* '(assert! (rule (append-to-form () ?y ?y))))
   (qeval* '(assert! (rule (append-to-form (?u . ?v) ?y (?u . ?z))
                           (append-to-form ?v ?y ?z))))
   
   (qeval* '(assert! (rule (reverse () ()))))
   (qeval* '(assert! (rule (reverse (?u . ?v) ?y)
                           (and (reverse ?v ?z)
                                (append-to-form ?z (?u) ?y)))))
   
   (test "Reverse"
         '((reverse (1 2 3) (3 2 1)))
         (qeval* '(reverse (1 2 3) ?x)))))

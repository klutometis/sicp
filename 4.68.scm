#!/usr/bin/env chicken-scheme
(use debug sicp sicp-eval-logic sicp-streams test)

(with-empty-database
 (lambda ()
   (qeval* '(assert! (rule (append-to-form () ?y ?y))))
   (qeval* '(assert! (rule (append-to-form (?u . ?v) ?y (?u . ?z))
                           (append-to-form ?v ?y ?z))))
   
   (qeval* '(assert! (reverse () ())))
   (qeval* '(assert! (rule (reverse (?u . ?v) ?y)
                           (and (reverse ?v ?z)
                                (append-to-form ?z (?u) ?y)))))
   
   (test "Reverse with append-to-form"
         '((reverse (1 2 3) (3 2 1)))
         (qeval* '(reverse (1 2 3) ?x)))
   (test-assert
    "The converse does not terminate."
    (not (terminates?
          (lambda () (qeval* '(reverse ?x (1 2 3)))))))))

(with-empty-database
 (lambda ()
   (qeval* '(assert! (rule (reverse () ?z ?z))))
   (qeval* '(assert! (rule (reverse (?h . ?t) ?z ?acc)
                           (reverse ?t ?z (?h . ?acc)))))

   (test
    "Reverse without append-to-form"
    '((reverse (1 2 3) (3 2 1) ()))
    (qeval* '(reverse (1 2 3) ?x ())))

   (test-assert
    "The converse does also not terminate."
    (not (terminates?
          (lambda () (qeval* '(reverse ?x (3 2 1) ()))))))))

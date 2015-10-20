#!/usr/bin/env chicken-scheme
(use sicp sicp-eval-logic test)

(with-empty-database
 (lambda ()
   (qeval* '(assert! (rule (?x next-to ?y in (?x ?y . ?u)))))
   (qeval* '(assert! (rule (?x next-to ?y in (?v . ?z))
                           (?x next-to ?y in ?z))))
   (test
    "All next-tos"
    '(((2 3) next-to 4 in (1 (2 3) 4))
      (1 next-to (2 3) in (1 (2 3) 4)))
    (qeval* '(?x next-to ?y in (1 (2 3) 4))))

   (test
    "Next-to specifically 1"
    '((3 next-to 1 in (2 1 3 1))
      (2 next-to 1 in (2 1 3 1)))
    (qeval* '(?x next-to 1 in (2 1 3 1))))))

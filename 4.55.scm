#!/usr/bin/env chicken-scheme

(use sicp-eval-logic test)

(with-microshaft-database
 (lambda ()
   (test
    "Ben Bitdiddle's supervisees"
    '((supervisor (Tweakit Lem E) (Bitdiddle Ben))
      (supervisor (Fect Cy D) (Bitdiddle Ben))
      (supervisor (Hacker Alyssa P) (Bitdiddle Ben)))
    (qeval* '(supervisor ?x (Bitdiddle Ben))))
   (test
    "People from accounting"
    '((job (Cratchet Robert) (accounting scrivener))
      (job (Scrooge Eben) (accounting chief accountant)))
    (qeval* '(job ?x (accounting . ?y))))
   (test
    "People from Slumerville"
    '((address (Aull DeWitt) (Slumerville (Onion Square) 5))
      (address (Reasoner Louis) (Slumerville (Pine Tree Road) 80))
      (address (Bitdiddle Ben) (Slumerville (Ridge Road) 10)))
    (qeval* '(address ?x (Slumerville . ?y))))))

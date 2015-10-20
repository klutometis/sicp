#!/usr/bin/env chicken-scheme
(use sicp-eval-logic test)

(include "genealogy.scm")

(with-genealogy
 (lambda ()
   ;; Base case for ending-in-grandson.
   (qeval* '(assert! (rule (grandson? (grandson)))))
   
   ;; Recurse to determine ending-in-grandson.
   (qeval* '(assert! (rule (grandson? (?x . rel?)
                                      (grandson? rel?)))))
   
   ;; (Grandson) is equivalent to grandson.
   (qeval* '(assert! (rule ((grandson) ?x ?y)
                           (grandson ?x ?y))))
   
   ;; Recurse on the relationship.
   (qeval* '(assert! (rule ((great . ?rel) ?x ?y)
                           (and (grandson? ?rel)
                                (all-son ?x ?z)
                                (?rel ?z ?y)))))
   
   (test
    "Great grandsons"
    '(((great grandson) Mehujael Jubal)
      ((great grandson) Irad Lamech)
      ((great grandson) Mehujael Jabal)
      ((great grandson) Enoch Methushael)
      ((great grandson) Cain Mehujael)
      ((great grandson) Adam Irad))
    (qeval* '((great grandson) ?g ?ggs)))
   (test
    "The relationship between Adam and Irad"
    '(((great grandson) Adam Irad))
    (qeval* '(?relationship Adam Irad)))
   (test
    "Is not clever enough to generalize to great{2,}-grandson!"
    '(((great great great great great grandson) Adam Irad))
    (qeval* '(?relationship Adam Jubal)))))

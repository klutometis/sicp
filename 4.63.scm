#!/usr/bin/env chicken-scheme
(use sicp sicp-eval-logic test)

(include "genealogy.scm")

(with-genealogy
 (lambda ()
   (test "Grandson of Cain"
         '((grandson Cain Irad))
         (qeval* '(grandson Cain ?grandson)))
   (test "Sons of Lamech"
         '((all-son Lamech Jubal)
           (all-son Lamech Jabal))
         (qeval* '(all-son Lamech ?son)))
   (test "Grandsons of Methushael"
         '((grandson Methushael Jubal)
           (grandson Methushael Jabal))
         (qeval* '(grandson Methushael ?grandson)))))

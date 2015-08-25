#!/usr/bin/env chicken-scheme

(use sicp sicp-eval-logic test)

(with-empty-database
 (lambda ()
   (qeval* '(assert! (son Adam Cain)))
   (qeval* '(assert! (son Cain Enoch)))
   (qeval* '(assert! (son Enoch Irad)))
   (qeval* '(assert! (son Irad Mehujael)))
   (qeval* '(assert! (son Mehujael Methushael)))
   (qeval* '(assert! (son Methushael Lamech)))
   (qeval* '(assert! (wife Lamech Ada)))
   (qeval* '(assert! (son Ada Jabal)))
   (qeval* '(assert! (son Ada Jubal)))
   (qeval* '(assert! (rule (wife-son ?father ?son)
                           (and (wife ?father ?mother)
                                (son ?mother ?son)))))
   (qeval* '(assert! (rule (all-son ?father ?son)
                           (or (wife-son ?father ?son)
                               (son ?father ?son)))))
   (qeval* '(assert! (rule (grandson ?grandfather ?grandson)
                           (and (all-son ?grandfather ?father)
                                (all-son ?father ?grandson)))))
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

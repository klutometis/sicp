#!/usr/bin/env chicken-scheme

(use sicp-eval-logic test)

(with-microshaft-database
 (lambda ()
   (qeval* '(assert!
             (rule (wheel ?person ?x)
                   (and (supervisor ?middle-manager ?person)
                        (supervisor ?x ?middle-manager)))))
   (test "Wheel plus subsupervisees"
         '((wheel (Warbucks Oliver) (Cratchet Robert))
           (wheel (Warbucks Oliver) (Tweakit Lem E))
           (wheel (Bitdiddle Ben) (Reasoner Louis))
           (wheel (Warbucks Oliver) (Fect Cy D))
           (wheel (Warbucks Oliver) (Hacker Alyssa P)))
         (qeval* '(wheel ?who ?x)))))

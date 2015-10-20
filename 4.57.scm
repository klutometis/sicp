#!/usr/bin/env chicken-scheme
(use sicp-eval-logic test)

(with-microshaft-database
 (lambda ()
   (qeval* '(assert! (can-do-job (computer wizard)
                                 (computer programmer))))
   (qeval* '(assert! (can-do-job (computer wizard)
                                 (computer technician))))
   (qeval* '(assert! (can-do-job (computer programmer)
                                 (computer programmer trainee))))
   (qeval* '(assert! (can-do-job (administration secretary)
                                 (administration big wheel))))
   (qeval* '(assert! (rule (can-replace ?replacer ?replacee)
                           (and (job ?replacer ?replacer-job)
                                (job ?replacee ?replacee-job)
                                (or (same ?replacer-job ?replacee-job)
                                    (can-do-job ?replacer-job ?replacee-job))
                                (not (same ?replacer ?replacee))))))
   (test
    "Can replace"
    '((can-replace (Bitdiddle Ben) (Fect Cy D))
      (can-replace (Hacker Alyssa P) (Fect Cy D)))
    (qeval* '(can-replace ?replacer (Fect Cy D))))
   
   (test
    "Can replace someone more expensive"
    '((and (can-replace (Aull DeWitt) (Warbucks Oliver))
           (salary (Aull DeWitt) 25000)
           (salary (Warbucks Oliver) 150000)
           (lisp-value > 150000 25000))
      (and (can-replace (Fect Cy D) (Hacker Alyssa P))
           (salary (Fect Cy D) 35000)
           (salary (Hacker Alyssa P) 40000)
           (lisp-value > 40000 35000)))
    (qeval* '(and (can-replace ?replacer ?replacee)
                  (salary ?replacer ?replacer-salary)
                  (salary ?replacee ?replacee-salary)
                  (lisp-value > ?replacee-salary ?replacer-salary))))))

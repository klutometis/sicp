(load "context.scm")

(initialize-data-base microshaft-data-base)

(query '(assert! (rule (same-job ?p1 ?p2)
                       (and (job ?p1 ?job)
                            (job ?p2 ?job)))))
(query '(assert! (rule (functionally-redundant ?p1 ?p2)
                       (and (job ?p1 ?job1)
                            (job ?p2 ?job2)
                            (can-do-job ?job1 ?job2)))))
(query '(assert! (rule (replaceth ?p1 ?p2)
                       (and (or (same-job ?p1 ?p2)
                                (functionally-redundant ?p1 ?p2))
                            (not (same ?p1 ?p2))))))
(define replaceth-fect (query '(replaceth ?p (Fect Cy D))))
(define replaceth-richer
  (query '(and (salary ?p1 ?s1)
               (salary ?p2 ?s2)
               (lisp-value < ?s1 ?s2)
               (replaceth ?p1 ?p2))))

(test
 "replaceth cy d. fect"
 '((replaceth (bitdiddle ben) (fect cy d)) (replaceth (hacker alyssa p) (fect cy d)))
 replaceth-fect
 'equal? equal?)

(test
 "replaceth richer"
 '((and (salary (aull dewitt) 25000) (salary (warbucks oliver) 150000) (lisp-value < 25000 150000) (replaceth (aull dewitt) (warbucks oliver))) (and (salary (fect cy d) 35000) (salary (hacker alyssa p) 40000) (lisp-value < 35000 40000) (replaceth (fect cy d) (hacker alyssa p))))
 replaceth-richer
 'equal? equal?)

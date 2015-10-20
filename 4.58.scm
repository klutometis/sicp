#!/usr/bin/env chicken-scheme
(use sicp-eval-logic test)

(with-microshaft-database
 (lambda ()
   (qeval* '(assert! (rule (big-shot ?big-shot ?division)
                           (and (job ?big-shot (?division . ?rest-division))
                                (or (not (supervisor ?big-shot ?supervisor))
                                    (and (supervisor ?big-shot ?supervisor)
                                         (not (job ?supervisor (?division . ?rest-supervisor-division)))))))))
   (test
    "Big shot"
    '((big-shot (Warbucks Oliver) administration)
      (big-shot (Scrooge Eben) accounting)
      (big-shot (Bitdiddle Ben) computer))
    (qeval* '(big-shot ?big-shot ?division)))))

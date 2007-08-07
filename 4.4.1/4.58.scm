(load "context.scm")

(initialize-data-base microshaft-data-base)

(query '(rule (same-division ?p1 ?p2)
              (and (job ?p1 (?div . ?r1))
                   (job ?p2 (?div . ?r2)))))

(query '(rule (big-shot ?p)
              (and (supervisor ?p ?s2)
                   (not (same-division ?p ?s2)))))

;; NB: does not contain Warbucks, who has no supervisors!
(define big-shots (query '(big-shot ?p)))

(test
 "big shots sans warbucks"
 '((big-shot (scrooge eben)) (big-shot (bitdiddle ben)))
 big-shots
 'equal? equal?)

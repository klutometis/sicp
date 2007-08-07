(load "context.scm")

(initialize-data-base microshaft-data-base)

(query '(rule (same-division ?p1 ?p2)
              (and (job ?p1 (?div . ?r1))
                   (job ?p2 (?div . ?r2)))))
(query '(rule (no-supervisors ?q)
              (and (supervisor ?p ?q)
                   (not (supervisor ?q ?r)))))
(query '(rule (big-shot ?p)
              (or (no-supervisors ?p)
                  (and (supervisor ?p ?s2)
                       (not (same-division ?p ?s2))))))
;; Includes spurious Warbucks'.
(define big-shots (query '(big-shot ?p)))

(test
 "big shots with spurious warbucks'"
 '((big-shot (warbucks oliver)) (big-shot (scrooge eben)) (big-shot (warbucks oliver)) (big-shot (bitdiddle ben)) (big-shot (warbucks oliver)))
 big-shots
 'equal? equal?)

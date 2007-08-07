(load "context.scm")

(initialize-data-base microshaft-data-base)

(query '(assert! (rule (same-division ?p1 ?p2)
                       (and (job ?p1 (?div . ?r1))
                            (job ?p2 (?div . ?r2))))))

(query '(assert! (rule (only-sub-supervisors ?q)
                       (and (supervisor ?p ?q)
                            (not (supervisor ?q ?r))))))

(query '(assert! (rule (big-shot ?p)
                       (or (only-sub-supervisors ?p)
                           (and (supervisor ?p ?s2)
                                (not (same-division ?p ?s2)))))))

;; NB: big shots must supervise someone; results contain redundant
;; Warbucks'.
(define big-shots (query '(big-shot ?p)))

(test
 "big shots with redundant warbucks"
 '((big-shot (warbucks oliver)) (big-shot (scrooge eben)) (big-shot (warbucks oliver)) (big-shot (bitdiddle ben)) (big-shot (warbucks oliver)))
 big-shots
 'equal? equal?)

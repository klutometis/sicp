(load "context.scm")

(initialize-data-base microshaft-data-base)

(query '(rule (same-division ?p1 ?p2)
              (and (job ?p1 (?div . ?r1))
                   (job ?p2 (?div . ?r2)))))
;; (query '(rule (no-supervisors ?q)
;;               (and (supervisor ?p ?q)
;;                    (not (supervisor ?q ?r)))))
(query '(rule (big-shot ?p)
              (or (no-supervisors ?p)
                  (and (supervisor ?p ?s2)
                       (not (same-division ?p ?s2))))))
;; Doesn't include warbucks; who has no supervisor!  (Got spurious
;; repetitions from (no-supervisors).)
(define big-shots-sans-warbucks (query '(big-shot ?p)))

(test
 "big shots sans warbucks"
 '((big-shot (scrooge eben)) (big-shot (bitdiddle ben)))
 big-shots-sans-warbucks
 'equal? equal?)

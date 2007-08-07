(load "context.scm")

(initialize-data-base microshaft-data-base)

(query '(rule (same-division ?p1 ?p2)
              (and (job ?p1 (?div . ?r1))
                   (job ?p2 (?div . ?r2)))))

;; ATTN: hideous hack! Contrary to the spirit (and letter) of logical
;; programming.
(define unique-values '())
(query '(rule (unique ?p)
              (and (always-true)
                   (lisp-value
                    (lambda (p) (if (member p unique-values)
                                    #f
                                    (let ((pair (list p)))
                                      (if (null? unique-values)
                                          (set! unique-values pair)
                                          (begin
                                            (set-cdr! unique-values (list p))
                                            #t))))) ?p))))
(query '(rule (no-supervisors ?q)
              (and (supervisor ?p ?q)
                   (not (supervisor ?q ?r)))))
(query '(rule (big-shot ?p)
              (and (or (no-supervisors ?p)
                       (and (supervisor ?p ?s2)
                            (not (same-division ?p ?s2))))
                   (unique ?p))))

;; Without the no-supervisors rule, big-shot doesn't include those
;; with no supervisors; no-supervisors introduces some complexity,
;; however.  (Can we resolve the spurious duplicates without recourse
;; to state-hacks?)
(define big-shots (query '(big-shot ?p)))

(test
 "big shots (NB: assumes that big-shot is a supervisor of somebody)"
 '((big-shot (warbucks oliver)) (big-shot (scrooge eben)) (big-shot (bitdiddle ben)))
 big-shots
 'equal? equal?)

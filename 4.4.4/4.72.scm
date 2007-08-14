(load "query-context.scm")

(define x 0)

(define queries
  '(
;;     (or (lisp-value (lambda () (write-line x) (set! x 1) #t))
;;         (lisp-value (lambda () (write-line x) (set! x 2) #t)))
;;     (assert! (rule (loop ?x (loop ?x))))
;;     (assert! (rule (loop ())))
;;     (loop ?y (loop ?y))
;;     (assert! (rule (two ?x)
;;                    (lisp-value (lambda () (set! x (1+ x)) #t))))
;;     (assert! (rule (one ?x)
;;                    (or
;;                     (?x (one ?x)))))
;;     (one ?x)
;;     (assert! (rule (avoids ?x ?y)
;;                    (owes ?x ?y)))
;;     (assert! (rule (avoids ?x ?y)
;;                    (and (owes ?x ?z)
;;                         (avoids ?z ?y))))
;;     (assert! (owes andy bill))
;;     (assert! (owes bill carl))
;;     (assert! (owes carl bill))
;;     (avoids andy ?x)
;;     (assert! (rule (fact 0 1)))
;;     (assert! (rule (fact ?n ?f)
;;     (assert! (rule (same ?x ?x)))
;;     (assert! (rule (member ?x (?y . ?z))
;;                    (or (same ?x ?y)
;;                        (member ?x ?z))))
;; ;;    (member 2 (1 2 3))
;;     (assert! (rule (avoids ?x ?y ?l)
;;                    (and (owes ?x ?y)
;;                         (not (member ?y ?l)))))
;;     (assert! (rule (avoids ?x ?y ?l)
;;                    (and (owes ?x ?z)
;;                         (not (member ?z ?l))
;;                         (avoids ?z ?y (?z . ?l)))))
;;     (assert! (owes andy bill))
;;     (assert! (owes bill carl))
;;     (assert! (owes carl bill))
;;     (avoids andy ?x ())
;;     (assert! (rule (zip ?l1 ?l2 ?zipped ?index)
;;                    (zip ?l1 ?l2 () ?zipped ?index)))
;;     (assert! (rule (zip () () ?zipped ?zipped ?index)))
;;     (assert! (rule (zip (?h1 . ?t1) (?h2 . ?t2) ?accumulated ?zipped ?index)
;;                    (zip ?t1 ?t2 (?h1 . (?h2 . ?accumulated)) ?zipped ?index)))
;;     (zip (1 1 1 1 1 1 1 1) (2 2 2 2 2 2 2 2) ?x ?y)
    ))

(initialize-data-base '())

(set! x 0)
(map query queries)

(define (flatten-stream stream)
  (if (stream-null? stream)
      the-empty-stream
      (stream-append-delayed
       (stream-car stream)
       (delay (flatten-stream (stream-cdr stream))))))


(define (disjoin disjuncts frame-stream)
  (if (empty-disjunction? disjuncts)
      the-empty-stream
      (stream-append-delayed
       (qeval (first-disjunct disjuncts) frame-stream)
       (delay (disjoin (rest-disjuncts disjuncts)
                       frame-stream)))))

(initialize-data-base '())

(set! x 0)
(map query queries)

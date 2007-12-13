;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "query-context.scm")
(load "query/append-to-form.scm")

(define queries
  '(
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
;;     (assert! (rule (same ?x ?x)))
;;     (assert! (rule (member ?x (?y . ?z))
;;                    (or (same ?x ?y)
;;                        (member ?x ?z))))
;; ;;    (member 2 (1 2 3))
;;     (assert! (rule (avoids ?x ?y ?l ?n)
;;                    (and (owes ?x ?y)
;;                         (not (member ?y ?l)))))
;;     (assert! (rule (avoids ?x ?y ?l ?n)
;;                    (and (owes ?x ?z)
;;                         (not (member ?z ?l))
;;                         (avoids ?z ?y (?z . ?l) ?n))))
;;     (assert! (owes andy bill))
;;     (assert! (owes bill carl))
;;     (assert! (owes carl bill))
;;     (avoids andy ?x () ?y)
;;     (assert! (same 2 3))
;;     (assert! (rule (same ?x ?x)))
;;     (same 2 3)
    (assert! (assert 2))
    (assert! (rule (test-assert)
                   (assert ?x)))
    (test-assert)
    ))

;; Rules are indeed applied before frames populated with assertions!
(trace find-assertions)
(trace apply-rules)
(initialize-data-base '())

(map query queries)

(define (simple-query query-pattern frame-stream)
  (stream-flatmap
   (lambda (frame)
     (stream-append (find-assertions query-pattern frame)
                    (apply-rules query-pattern frame)))
   frame-stream))

(define (disjoin disjuncts frame-stream)
  (if (empty-disjunction? disjuncts)
      the-empty-stream
      (interleave
       (qeval (first-disjunct disjuncts) frame-stream)
       (disjoin (rest-disjuncts disjuncts) frame-stream))))

(initialize-data-base '())

(map query queries)

;; (query '(assert! (rule (loop ?x (loop ?x)))))
;; ;                       (loop ?y (loop ?y)))))
;; (query '
;; (query '
;;(query '(assert! (rule (two ?x) (or (always-true) (one ?x)))))
;;(query '(assert! (rule (one ?x) (or (always-true) (two ?x)))))
;; (query '(assert! (rule (one ?x)
;;                        (or
;;                         (1)
;;                         (or
;;                          (always-true)
;;                          (two ?x))
;;                          ))))
;;(query '(two 1))

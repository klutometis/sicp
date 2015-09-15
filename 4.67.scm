#!/usr/bin/env chicken-scheme

(use sicp-eval-logic sicp-streams test)

(define history (make-parameter (make-hash-table)))

;; If e.g. (? boss) has been renamed (? 1 boss), unrename it to (?
;; boss); otherwise, do nothing.
(define (unrename-variable var)
  (if (number? (cadr var))
      (list (car var) (caddr var))
      var))

(define (apply-a-rule rule query-pattern query-frame)
  (let ((clean-rule (rename-variables-in rule)))
    (let ((unify-result (unify-match query-pattern
                                      (conclusion clean-rule)
                                      query-frame)))
      (if (eq? unify-result 'failed)
          the-empty-stream
          ;; Try to instantiate the query-pattern against the
          ;; query-frame, reverting any renamings that have taken
          ;; place for unbound variables (e.g. (? 1 boss) becomes
          ;; simply (? boss)).
          (let ((instantiation
                 (instantiate query-pattern
                              query-frame
                              (lambda (var frame)
                                (unrename-variable var)))))
            (if (hash-table-ref/default (history) instantiation #f)
                the-empty-stream
                (begin
                  (hash-table-set! (history) instantiation #t)
                  (qeval (rule-body clean-rule)
                         (singleton-stream unify-result)))))))))

(with-microshaft-database
 (lambda ()
   (qeval* '(assert! (rule (outranked-by ?staff-person ?boss)
                           (or (supervisor ?staff-person ?boss)
                               (and
                                (outranked-by ?middle-manager ?boss)
                                (supervisor ?staff-person ?middle-manager))))))
   (parameterize ((history (make-hash-table)))
     (test
      "Catch pathological recursion"
      '((outranked-by (Bitdiddle Ben) (Warbucks Oliver)))
      (qeval* '(outranked-by (Bitdiddle Ben) ?who))))))

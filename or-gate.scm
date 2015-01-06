#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*3.28][3\.28:1]]

(define (logical-or s t)
  (cond ((and (= s 1) (= t 1)) 1)
        ((and (= s 1) (= t 0)) 1)
        ((and (= s 0) (= t 1)) 1)
        ((and (= s 0) (= t 0)) 0)
        (else (error "Invalid signal" s))))

(define (or-gate a1 a2 output)
  (define (or-action-procedure)
    (let ((new-value
           (logical-or (get-signal a1) (get-signal a2))))
      (after-delay
       (or-gate-delay)
       (lambda () (set-signal! output new-value)))))
  (add-action! a1 or-action-procedure)
  (add-action! a2 or-action-procedure)
  'ok)

;; 3\.28:1 ends here

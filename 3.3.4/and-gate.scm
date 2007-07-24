(load "after-delay.scm")
(load "and-gate-delay.scm")
(load "set-signal!.scm")
(load "add-action!.scm")
(load "get-signal.scm")
(load "logical-and.scm")

(define (and-gate a1 a2 output)
  (define (and-action-procedure)
    (let ((new-value
           (logical-and (get-signal a1) (get-signal a2))))
      (after-delay and-gate-delay
                   (lambda ()
                     (set-signal! output new-value)))))
  (add-action! a1 and-action-procedure)
  (add-action! a2 and-action-procedure)
  'ok)

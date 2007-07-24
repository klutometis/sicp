(load "and-gate-delay.scm")
(load "inverter-delay.scm")
(load "logical-and.scm")
(load "logical-not.scm")
(load "add-action!.scm")
(load "set-signal!.scm")
(load "get-signal.scm")
(load "after-delay.scm")

(define (or-gate-compound a1 a2 output)
  (define (or-action-procedure)
    (let ((new-value
           (logical-not
            (logical-and
             (logical-not (get-signal a1))
             (logical-not (get-signal a2))))))
      (after-delay (+ (* 3 inverter-delay) and-gate-delay)
                   (lambda()
                     (set-signal! output new-value)))))
  (add-action! a1 or-action-procedure)
  (add-action! a2 or-action-procedure)
  'ok)

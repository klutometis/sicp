#!/usr/bin/env chicken-scheme

(use bindings sicp-streams test)

(include "add-streams.scm")
(include "integral.scm")

(define (RLC R C L dt)
  (lambda (vC0 iL0)
    (define vC (integral (delay dvC) vC0 dt))
    (define iL (integral (delay diL) iL0 dt))
    (define diL (add-streams (scale-stream iL (/ (- R) L))
                             (scale-stream vC (/ (- 1) L))))
    (define dvC (scale-stream iL (/ -1 C)))
    (cons vC iL)))

(bind-let (((vC . iL) ((RLC 1 0.2 1 0.1) 10 0)))
          (test 14.6445 (stream-ref vC 5))
          (test -4.5491 (stream-ref iL 5)))

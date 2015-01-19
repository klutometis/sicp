#!/usr/bin/env chicken-scheme

(use sicp test)

(define (or-gate a1 a2 output)
  (let ((a3 (make-wire))
        (a4 (make-wire))
        (a5 (make-wire)))
    (inverter a1 a3)
    (inverter a2 a4)
    (and-gate a3 a4 a5)
    (inverter a5 output)
    'ok))

(define (test-or-gate test-or-gate)
  (let ((a (make-wire))
        (b (make-wire))
        (c (make-wire)))
    (or-gate a b c)
    (test-or-gate a b c)))

(test-or-gate
 (lambda (a b c)
   (propagate)
   (test 0 (get-signal c))))

(test-or-gate
 (lambda (a b c)
   (set-signal! a 1)
   (propagate)
   (test 1 (get-signal c))))

(test-or-gate
 (lambda (a b c)
   (set-signal! b 1)
   (propagate)
   (test 1 (get-signal c))))

(test-or-gate
 (lambda (a b c)
   (set-signal! a 1)
   (set-signal! b 1)
   (propagate)
   (test 1 (get-signal c))))

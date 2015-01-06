#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*3.28][3\.28:1]]

(use sicp test)

(include "or-gate.scm")

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

;; 3\.28:1 ends here

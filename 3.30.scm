#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*3.30][3\.30:1]]

(use sicp srfi-26 test)

(define (ripple-carry-adder a b s c-out)
  (let iter ((a a)
             (b b)
             (s s)
             (c-in (make-wire)))
    (unless (null? a)
      (let ((c-out (if (null? (cdr a)) c-out (make-wire))))
        (full-adder (car a) (car b) c-in (car s) c-out)
        (iter (cdr a) (cdr b) (cdr s) c-out)))))

(let ((a (list (make-wire 1)
               (make-wire 1)
               (make-wire 1)
               (make-wire 1)))
      (b (list (make-wire 1)
               (make-wire 1)
               (make-wire 1)
               (make-wire 1)))
      (s (list (make-wire)
               (make-wire)
               (make-wire)
               (make-wire)))
      (c (make-wire)))
  (ripple-carry-adder a b s c)
  (propagate)
  (test "15 + 15 = 30 in binary"
        '(1 1 1 1 0)
        (map get-signal (cons c (reverse s)))))

;; 3\.30:1 ends here

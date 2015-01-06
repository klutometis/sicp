#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*Termination-test][Termination-test:1]]

(use srfi-18 test)

(define default-timeout (make-parameter 1))
(define-record timeout-value)
(define timeout-value (make-timeout-value))

(define terminates?
  (case-lambda
   ((thunk) (terminates? thunk (default-timeout)))
   ((thunk timeout)
    (let ((thread (make-thread thunk)))
    (thread-start! thread)
    (not
     (timeout-value?
      (thread-join! thread timeout timeout-value)))))))

;; Termination-test:1 ends here

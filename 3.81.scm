#!/usr/bin/env chicken-scheme
(use numbers sicp-streams test)

(include "rand-update.scm")

(define random-init (make-parameter 0))

(define random-number-stream
  (case-lambda
   ((requests) (random-number-stream requests (random-init)))
   ((requests seed)
    (if (stream-null? requests)
        stream-null
        (let ((request (stream-car requests)))
          (bind-case
           request
           ((reset seed)
            (cons-stream
             seed
             (random-number-stream (stream-cdr requests) seed)))
           (generate
            (let ((next (rand-update seed)))
              (cons-stream
               next
               (random-number-stream (stream-cdr requests) next))))))))))

(parameterize ((random-init 5))
  (test '(14816632086413376816
          2587011477941047999
          5
          14816632086413376816
          2587011477941047999)
        (stream->list
         (random-number-stream
          (list->stream
           '(generate
             generate
             (reset 5)
             generate
             generate))))))

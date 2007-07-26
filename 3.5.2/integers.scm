(load "add-streams.scm")

(define integers (cons-stream 1 (add-streams ones integers)))

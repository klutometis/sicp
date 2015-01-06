#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*3.50][3\.50:1]]

(define (stream-map proc . argstreams)
  (if (stream-null? (car argstreams))
      stream-null
      (cons-stream
       (apply proc (map stream-car argstreams))
       (apply stream-map
              (cons proc (map stream-cdr argstreams))))))

;; 3\.50:1 ends here

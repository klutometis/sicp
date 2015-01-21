#!/usr/bin/env chicken-scheme

(define (stream-map proc . argstreams)
  (if (any stream-null? argstreams)
      stream-null
      (cons-stream
       (apply proc (map stream-car argstreams))
       (apply stream-map
              (cons proc (map stream-cdr argstreams))))))

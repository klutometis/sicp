(load "test.scm")
(load "add-streams.scm")
(load "display-stream-n.scm")

;;     1 ...
;;     1 ...
;;   1 1 ...
;; 1 1 1 ...
;; ---------
;; 1 2 4 8 ...

(define s (cons-stream 1 (add-streams s s)))

(define powers-of-2 (stream-head s 10))

(test
 "2^n by recursive add-streams"
 'canonical
 '(1 2 4 8 16 32 64 128 256 512)
 powers-of-2
 'equal?
 equal?)

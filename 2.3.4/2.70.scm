;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "generate-huffman-tree.scm")
(load "encode.scm")

(define alphabet '((a 2) (boom 1) (get 2) (job 2) (na 16) (sha 3) (yip 9) (wah 1)))
(define tree (generate-huffman-tree alphabet))
(define messages (list
           '(get a job)
           '(sha na na na na na na na na)
           '(get a job)
           '(sha na na na na na na na na)
           '(wah yip yip yip yip yip yip yip yip)
           '(sha boom)))

(define (count-bits message-operation)
  (reduce + 0 (map (lambda (message) (message-operation message)) messages)))

(define message-operations
  (list
   ;; Count the Huffman encoding-length
   (lambda (message) (length (encode message tree)))
   ;; Count the fixed-length encoding-length
   (lambda (message) (* (expt 2 3) (length message)))))

(for-each (lambda (message-operation) (newline) (display (count-bits message-operation)))
          message-operations)
;; 82 bits are required for Huffman encoding; vs. 280 for fixed-length.

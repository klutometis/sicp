#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.69][2\.69:1]]

(use sicp traversal)

(define (adjoin-leaf-set tree leaf-set)
  (if (null? leaf-set)
      (list tree)
      (let ((leaf (car leaf-set)))
        (if (> (weight tree) (weight leaf))
            (cons leaf (adjoin-tree tree (cdr leaf-set)))
            (cons tree leaf-set)))))

(define (successive-merge leaf-set)
  (if (= 1 (length leaf-set))
      ;; What if it's a single leaf?
      (if (leaf? leaf-set)
          leaf-set
          (car leaf-set))
      (successive-merge (adjoin-leaf-set (make-code-tree (cadr leaf-set)
                                                         (car leaf-set))
                                         (cddr leaf-set)))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

;; 2\.69:1 ends here

#!/usr/bin/env chicken-scheme

(use sicp srfi-1 test)

(define (encode-symbol symbol tree)
  (if (leaf? tree)
      '()
      (cond ((memq symbol (symbols (left-branch tree)))
             (cons 0 (encode-symbol symbol (left-branch tree))))
            ((memq symbol (symbols (right-branch tree)))
             (cons 1 (encode-symbol symbol (right-branch tree))))
            (else (error "Symbol not in tree -- ENCODE-SYMBOL" symbol)))))

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree
                    (make-leaf 'D 1)
                    (make-leaf 'C 1)))))

(test '(0 1 1 0 0 1 0 1 0 1 1 1 0)
      (encode '(A D A B B C A) sample-tree))

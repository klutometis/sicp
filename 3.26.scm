#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*3.26][3\.26:1]]

(include "tree-sets.scm")

(define key-value cons)
(define key car)
(define value cdr)

(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((= (key x) (key (entry set))) #t)
        ((< (key x) (key (entry set)))
         (element-of-set? x (left-branch set)))
        ((> (key x) (key (entry set)))
         (element-of-set? x (right-branch set)))))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
        ((= (key x) (key (entry set))) set)
        ((< (key x) (key (entry set)))
         (make-tree (entry set)
                    (adjoin-set x (left-branch set))
                    (right-branch set)))
        ((> x (entry set))
         (make-tree (entry set) (left-branch set)
                    (adjoin-set x (right-branch set))))))

(define (lookup lookup-key tree)
  (if (null? tree)
      #f
      (let ((entry (entry tree)))
        (cond ((= lookup-key (key entry)) (value entry))
              ((< lookup-key (key entry))
               (lookup lookup-key (left-branch tree)))
              (else (lookup lookup-key (right-branch tree)))))))

(let ((tree (list->tree (list (key-value 1 'a)
                              (key-value 3 'b)
                              (key-value 6 'c)
                              (key-value 10 'd)))))
  (test 'c (lookup 6 tree))
  (test-assert (not (lookup 5 tree))))

;; 3\.26:1 ends here

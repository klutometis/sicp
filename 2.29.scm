#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.29][2\.29:1]]

(use test)

(define (make-mobile left right)
  (list left right))
(define (make-branch length structure)
  (list length structure))

(define left-branch car)
(define right-branch cadr)

(define branch-length car)
(define branch-structure cadr)

(define (total-weight mobile)
  (let ((left-structure (branch-structure (left-branch mobile)))
        (right-structure (branch-structure (right-branch mobile))))
    (+ (if (number? left-structure)
           left-structure
           (total-weight left-structure))
       (if (number? right-structure)
           right-structure
           (total-weight right-structure)))))

(define mobile
  (make-mobile (make-branch
                2
                (make-mobile
                 (make-branch
                  2
                  (make-mobile
                   (make-branch 3 16)
                   (make-branch 2 20)))
                 (make-branch 4 20)))
               (make-branch 5 102.4)))

(define (torque branch)
  (let ((structure (branch-structure branch)))
    (* (branch-length branch)
       (if (number? structure)
           structure
           (+ (torque (left-branch structure))
              (torque (right-branch structure)))))))

(define (balanced? mobile)
  (= (torque (left-branch mobile))
     (torque (right-branch mobile))))

(test 158.4 (total-weight mobile))

(test-assert (balanced? mobile))

;; 2\.29:1 ends here

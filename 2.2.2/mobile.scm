;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (branch-weight branch)
  (let ((structure (branch-structure branch)))
    (if (branch-mobile? structure)
        (total-weight structure)
        structure)))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

(define (right-branch mobile)
  (list-ref mobile 1))

(define (print-branch branch)
  (let ((length (branch-length branch))
        (structure (branch-structure branch)))
    (display length)
    (display ": ")
    (if (branch-mobile? structure)
        (print-mobile structure)
        (display structure))))

(define (print-mobile mobile)
  (display "[")
  (print-branch (left-branch mobile))
  (display ", ")
  (print-branch (right-branch mobile))
  (display "]"))

(define (mobile-balanced? mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    ;; Don't fall through on or.
    (and (or (not (branch-mobile? left)) (delay (mobile-balanced? left)))
         (or (not (branch-mobile? right)) (delay (mobile-balanced? right)))
         (= (branch-torque left) (branch-torque right)))))

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (list-ref mobile 0))

(define (branch-torque branch)
  (let ((length (branch-length branch))
        (weight (branch-weight branch)))
    (* length weight)))

(define (branch-structure branch)
  (list-ref branch 1))

(define (branch-mobile? branch)
  (pair? branch))

(define (branch-length branch)
  (list-ref branch 0))

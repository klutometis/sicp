;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../1.3.4/section)
(require '../util/util)
(import* util approx?)
(import* section-1.3.4
         fixed-point-of-transform
         average-damp
         repeated)

(define (root-fixed-point-of-transform radicand nth-root average-damps)
  (fixed-point-of-transform
   (lambda (y) (/ radicand (expt y (- nth-root 1))))
   (repeated average-damp average-damps)
   1.0))

;; (define (test x a)
;;   (define (iter n)
;;     (format #t "root: ~A; power: ~A; result: ~A~%"
;;             x n (root (expt x n) n a))
;;     (iter (+ n 1)))
;;   (iter 0))
;; (test 3 3)

;; Gleaned from tests above: should apply average damp
;; m - 1 times, where m is the first power of two greater
;; than the nth-root.
(define (average-damps-heuristic nth-root)
  (define (iter m)
    (let ((2-to-the-mth (expt 2 m)))
      (if (> 2-to-the-mth nth-root)
        (- m 1)
        (iter (+ m 1)))))
  (iter 0))

(define (root radicand nth-root)
  (root-fixed-point-of-transform radicand nth-root (average-damps-heuristic nth-root)))

(check (root 256 8) (=> approx?) 2.0)
(check (root 65536 16) (=> approx?) 2.0)

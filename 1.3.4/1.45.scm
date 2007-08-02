(load "fixed-point-of-transform.scm")
(load "average-damp.scm")
(load "repeated.scm")

(define (root-fixed-point-of-transform radicand nth-root average-damps)
  (fixed-point-of-transform (lambda (y) (/ radicand (expt y (- nth-root 1))))
                            (repeated average-damp average-damps)
                            1.0))

;; (define (test x a)
;;   (define (iter n)
;;     (write-line (string-append "root: " (number->string x) "; power: " (number->string n) "; result: " (number->string (root (expt x n) n a))))
;;     (iter (+ n 1))
;;     )
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

(root 256 8)
(root 65536 16)

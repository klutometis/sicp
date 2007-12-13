;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "ones.scm")
(load "scale-stream.scm")
(load "add-streams.scm")

;; Assuming that the pairs are taken from non-negative integers (all
;; (S_i, T_j) i >=0, j >= 0) and the first placement is at time 0.
(define (calculate-placement pair)
  (define 2^n-stream (cons-stream 1 (add-streams 2^n-stream 2^n-stream)))
  (define (first-part i)
    (cond ((= i -1) -1)
          ((zero? i) 0)
          (else (-1+ (reduce + 0 (stream-head 2^n-stream (1+ i)))))))
  (let ((i (car pair))
        (j (cadr pair)))
    (if (= i j)
        (first-part i)
        (fold-right + (first-part (-1+ i)) (stream-head (scale-stream ones (expt 2 (1+ i))) (- j i))))))


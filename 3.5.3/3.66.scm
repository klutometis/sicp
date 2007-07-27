(load "test.scm")
(load "pairs.scm")
(load "integers.scm")
(load "find-pair.scm")
(load "calculate-placement.scm")

;;           | i = j -> (Sigma_{k=0}^i 2^k) -1
;; t_{i,j} = |
;;           | i < j -> (Sigma_{k=i+1}^j 2^{i+1}) + t_{i-1,i-1}
;;           
;; where t_{-1,-1} = -1.

;; Substract one because the calculated placement is 0-based.
(define empirical-1-100
  (-1+ (stream-length (find-pair '(1 100) (pairs integers integers)))))
(define calculated-1-100 (calculate-placement '(1 100)))
(define calculated-99-100 (calculate-placement '(99 100)))
(define calculated-100-100 (calculate-placement '(100 100)))

(test
 "empirical (1 100) vs. calculated (1 100)"
 empirical-1-100
 calculated-1-100
 '=
 =
 '(stream-length (find-pair '(1 100) (pairs integers integers))))

(test
 "calculated (99 100)"
 1901475900342344102245054808062
 calculated-99-100
 '=
 =)

(test
 "calculated (100 100)"
 2535301200456458802993406410750
 calculated-100-100
 '=
 =)

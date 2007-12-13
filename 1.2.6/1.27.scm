;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "fast-prime.scm")

(define (carmichael? n)
  (define (test-congruence a)
    (= (expmod a n n) a))
  (define (iter a)
    (if (= n a)
        ;; Additionally check if it passes Fermat.
        (fast-prime-n? n)
        (if (test-congruence a)
            (iter (+ a 1)))))
  (iter 1))

(carmichael? 561)
(carmichael? 1105)
(carmichael? 1729)
(carmichael? 2465)
(carmichael? 2821)
(carmichael? 6601)

          

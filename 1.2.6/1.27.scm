;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check (srfi 1))
(require '../1.2.6/section)
(require '../util/util)
(import* section-1.2.6 expmod fast-prime-n?)
(import* util identity)

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

(check (every identity
              (list (carmichael? 561)
                    (carmichael? 1105)
                    (carmichael? 1729)
                    (carmichael? 2465)
                    (carmichael? 2821)
                    (carmichael? 6601)))
       => #t)
          

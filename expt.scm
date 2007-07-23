;; (exp 100000 0)
(exp 2 100)

;; (define (expt-iteration b n)
;;   (expt-iter b n 1))

;; (define (expt-iter b counter product)
;;   (display (string-append "expt-iter " (number->string b) " " (number->string counter) " " (number->string product)))
;;   (newline)
;;   (if (= counter 0)
;;       product
;;       (expt-iter b
;;                  (- counter 1)
;;                  (* b product))))

;; (expt-iteration 2 100)

;; (define (fast-expt b n)
;;   (display (string-append "fast-expt " (number->string b) " " (number->string n)))
;;   (newline)
;;   (cond ((= n 0) 1)
;;         ((even? n) (square (fast-expt b (/ n 2))))
;;         (else (* b (fast-expt b (- n 1))))))

;; (fast-expt 2 1000)

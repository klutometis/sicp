#!/usr/bin/env chicken-scheme
(use sicp-eval sicp-eval-amb test)

(with-require `((< ,<)
                (= ,=)
                (+ ,+)
                (* ,*)
                (list ,list))
  (lambda (env)
    ;; An-integer-between is inclusive on the lower-bound, exclusive
    ;; on the upper.
    (ambeval* '(define (an-integer-between low high)
                 (require (< low high))
                 (amb low (an-integer-between (+ low 1) high)))
              env)
    (ambeval* '(define (a-pythagorean-triple-between low high)
                  (let ((i (an-integer-between low high)))
                    (let ((j (an-integer-between i high)))
                      (let ((k (an-integer-between j high)))
                        (require (= (+ (* i i) (* j j)) (* k k)))
                        (list i j k)))))
               env)
    (test "The first pythagorean triple"
          '(3 4 5)
          (ambeval-n '(a-pythagorean-triple-between 1 6) env 1))))

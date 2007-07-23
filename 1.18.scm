(define (iter-log-* n b)
  (display (string-append "iter-log-* " (number->string n) " " (number->string b)))
  (newline)
  (define (double a)
    (* 2 a))
  (define (halve a)
    (/ a 2))
  (define (iter a n b)
    (display (string-append "iter " (number->string a) " " (number->string n) " " (number->string b)))
    (newline)
    (cond ((= n 0) a)
          ((even? n) (iter a (halve n) (double b)))
          (else (iter (+ a b) (- n 1) b))))
  (iter 0 n b))

(iter-log-* 8 8)

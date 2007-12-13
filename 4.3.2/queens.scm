;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

;; TODO: Really needs a recursive procedure (see queens.scm from
;; 2.2.3).
(define (queens n)
  (define (q-symbol n)
    (string->symbol (string-append "q" (number->string n))))
  (define (iteration k)
    (append
     (list 'let
           (list (list (q-symbol k)
                       `(an-integer-between 1 ,n)))
           (list 'require
                 (list 'safe?
                       (cons 'list
                             (map
                              (lambda (i) (q-symbol i))
                              (iota (1+ (- n k)) n -1))))
                 ))
     (if (> k 1)
         (list (iteration (-1+ k)))
         (list (cons 'list (map
                            (lambda (i) (q-symbol i))
                            (iota n n -1)))))))
  (iteration n))

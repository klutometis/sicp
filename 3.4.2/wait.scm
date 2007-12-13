;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (wait)
  (let* ((max wait-cycles)
         (n (random max)))
    (let lp ((i 0))
      (if (< i n)
          (lp (1+ i))))))


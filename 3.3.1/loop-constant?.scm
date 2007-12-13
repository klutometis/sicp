;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

;; Only works if first element reappears in the cycle!
(define (loop? x)
  (define (loop?-iter x incipit)
    (if (pair? x)
        (if (eqv? (car x) incipit)
            #t
            (loop?-iter (cdr x) incipit))
        #f))
  (if (pair? x)
      (loop?-iter (cdr x) (car x))
      #f))

;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (loop? x)
  (define (loop?-iter x visa)
    (if (pair? x)
        (if (memq x visa)
            #t
            (loop?-iter (cdr x) (cons x visa)))
        #f))
  (loop?-iter x '()))

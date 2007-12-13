;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (ambeval-global-until-fail exp)
  (let ((result '()))
    (let loop ((next '()))
      (if (null? next)
          (ambeval
           exp
           the-global-environment
           (lambda (val next-alternative)
             (if (null? result)
                 (set! result (list val))
                 (append! result (list val)))
             (loop next-alternative))
           (lambda ()
             result))
          (next)))))

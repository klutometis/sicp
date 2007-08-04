(load "ambeval.scm")

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

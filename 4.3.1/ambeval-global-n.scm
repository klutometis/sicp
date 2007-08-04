(load "ambeval.scm")

(define (ambeval-global-n exp n)
  (let ((result '()))
    (let loop ((next '()))
      (if (zero? n)
          result
          (if (null? next)
              (ambeval
               exp
               the-global-environment
               (lambda (val next-alternative)
                 ;; Have to resort to side effects?
                 (if (null? result)
                     (set! result (list val))
                     (append! result (list val)))
                 (set! n (-1+ n))
                 (loop next-alternative))
               (lambda ()
                 result))
              (next))))))

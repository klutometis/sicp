;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (make-element content)
  (let ((previous '())
        (next '()))
    (define (set-previous! element)
      (set! previous element))
    (define (set-next! element)
      (set! next element))
    (define (dispatch m)
      (cond
       ((eq? m 'next) next)
       ((eq? m 'previous) previous)
       ((eq? m 'content) content)
       ((eq? m 'set-previous!) set-previous!)
       ((eq? m 'set-next!) set-next!)
       (else (error "Unknown dispatch -- MAKE-ELEMENT" m))))
    dispatch))

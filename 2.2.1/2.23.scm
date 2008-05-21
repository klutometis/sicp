;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension check)

(define (for-each applicans applicanda)
  (if (null? applicanda)
      ;; Unspecified return value
      (newline)
      (begin (applicans (car applicanda))
             (for-each applicans (cdr applicanda)))))

(let ((source (list 3 2 1))
      (target '()))
  ;; Some contrived side-effect
  (for-each (lambda (x) (set! target (cons x target))) source)
  (check target => '(1 2 3)))

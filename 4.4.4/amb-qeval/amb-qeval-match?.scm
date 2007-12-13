;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define amb-qeval-match?
  '(define (amb-qeval-match? patterns data)
;;     (write-line data)
     (if (equal? patterns data)
         true
         (if (and (pair? patterns)
                  (pair? data))
             (let ((pattern (car patterns))
                   (datum (car data)))
               (if (or (amb-qeval-var? pattern)
                       (equal? pattern datum))
                   (amb-qeval-match? (cdr patterns)
                                     (cdr data))
                   false))
             false))))

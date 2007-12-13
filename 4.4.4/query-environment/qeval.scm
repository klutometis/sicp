;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (qeval query environment-stream)
  (let ((qproc (get (type query) 'qeval)))
    (if qproc
        (qproc (contents query) environment-stream)
        (simple-query query environment-stream))))

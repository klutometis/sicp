;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (run-battery battery evaluator)
  (for-each (lambda (test)
              (test (lambda (evaluanda testandum)
                      (let ((result (testandum (evaluator evaluanda))))
                        (format #t "value: ~A~%~%" result)))))
            battery))

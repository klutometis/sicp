;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (test-return test-name result)
  (let ((value (test
                test-name
                result
                #!default
                'eq? eq?)))
    (format #t "value: ~A~%~%" value)))

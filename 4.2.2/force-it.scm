;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "thunk?.scm")
(load "memoized-thunk?.scm")
(load "thunk-value.scm")
(load "thunk-exp.scm")
(load "thunk-env.scm")
(load "evaluated-thunk?.scm")
;(load "actual-value.scm")

(define (force-it obj)
  (cond ((thunk? obj)
         (actual-value (thunk-exp obj)
                       (thunk-env obj)))
        ((memoized-thunk? obj)
         (let ((result (actual-value
                        (thunk-exp obj)
                        (thunk-env obj))))
           (set-car! obj 'evaluated-thunk)
           (set-car! (cdr obj) result)
           (set-cdr! (cdr obj) '())
           result))
        ((evaluated-thunk? obj)
         (thunk-value obj))
        (else obj)))

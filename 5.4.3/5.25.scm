;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "eceval-lazy-context.scm")
;(load "eceval-context.scm")

;(trace thunk-exp)
(define the-global-environment (setup-environment))
;((eceval 'set-breakpoint) 'force-it 1)
;((eceval 'trace-reg-on) 'val)
;((eceval 'trace-reg-on) 'proc)
((eceval 'trace-reg-on) 'argl)
;((eceval 'trace-reg-on) 'continue)
;; ((eceval 'trace-reg-on) 'exp)
(eceval 'trace-on)
;(eceval-global '(define a 2))
;(eceval-global '(if (= a 2) 1 2))
;(eceval-global '((lambda (a) (if (= a 2) 1 2)) 2))
(eceval-global '((lambda (a) (+ a a)) 2))
;(eceval-global '(+ 2 3))
;; (eceval-global '(define (try a b)
;;                   (if (= a 0) 1 b)))
;; (eceval-global '(try 0 (/ 1 0)))
;; (eceval-global '(begin
;;                   (define (try a b)
;;                     (if (= a 0) 1 b))
;;                   (try 0 (/ 1 0))))

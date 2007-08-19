(load "register-machine-context.scm")
(load "test-context.scm")

(define make-ambiguous-machine
  (lambda ()
    (make-machine
     '(a)
     '()
     '(start
       (goto (label here))
       here
       (assign a (const 3))
       (goto (label there))
       here
       (assign a (const 4))
       (goto (label there))
       there))))

(define ambiguous-machine (make-ambiguous-machine))
(start ambiguous-machine)
(define ambiguous-result
  (get-register-contents ambiguous-machine 'a))

(load "register-machine/extract-labels-once.scm")

(define ambiguous-error
  (condition? (ignore-errors (lambda () (make-ambiguous-machine)))))

(test
 "ambiguous machine returns 3"
 3
 ambiguous-result
 '= =)

(test
 "under modified extract-labels, ambiguous labels produce an error"
 #t
 ambiguous-error
 'eq? eq?)

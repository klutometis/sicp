;;; Purports to solve the Turing halting problem for a limited
;;; temporal domain.  Thanks to aspect on #scheme for the fall-through
;;; and-hack.
(define (terminate? thunk)
  (let ((thread (thread-start! (make-thread thunk))))
    (and (thread-join! thread 1 #f)
         (thread-terminate! thread)
         #t)))

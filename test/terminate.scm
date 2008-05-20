;;; Purports to solve the Turing halting problem for a limited
;;; temporal domain.
(define (terminate? thunk)
  (let ((thread (thread-start! (make-thread thunk))))
    (if (thread-join! thread 1 #f)
        #t
        (begin
          (thread-terminate! thread)
          #f))))

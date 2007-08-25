(define delay-it
  '(delay-it
    (assign exp (op list) (const 'thunk) (reg exp) (reg env))
;;     (save proc)
;;     (save argl)
    (goto (reg continue))
    ))

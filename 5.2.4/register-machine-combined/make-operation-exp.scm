(define (make-operation-exp exp machine labels operations)
  (let ((op (lookup-prim (operation-exp-op exp) operations))
        (aprocs
         (map (lambda (e)
                (if (or (constant-exp? e)
                        (register-exp? e))
                    (make-primitive-exp e machine labels)
                    (error
                     "Operation on non-constant or -register -- MAKE-OPERATION-EXP"
                     e)))
              (operation-exp-operands exp))))
    (lambda ()
      (apply op (map (lambda (p) (p)) aprocs)))))

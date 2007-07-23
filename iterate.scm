(define (iter f iterandum)
  (apply f (list (car iterandum)))
  (if (not (null? (cdr iterandum)))
      (iter f (cdr iterandum))
      )
  )

(iter display (list 1 2 3 4))

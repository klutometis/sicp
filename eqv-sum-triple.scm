(define (eqv-sum-triple? sum triple)
  (eqv? sum (+ (car triple) (cadr triple) (caddr triple))))

;; (eqv-sum-triple? 6 (list 3 2 1))

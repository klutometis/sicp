(define (ambeval exp env succeed fail)
  ((analyze exp) env succeed fail))

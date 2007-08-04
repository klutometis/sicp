(load "analyze.scm")

(define (ambeval exp env succeed fail)
  ((analyze exp) env succeed fail))

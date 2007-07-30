(load "do-parameter-step-omitted?.scm")
(load "do-parameter-variable.scm")

(define (do-parameter-step parameter)
  (if (do-parameter-step-omitted? parameter)
      (do-parameter-variable parameter)
      (caddr parameter)))

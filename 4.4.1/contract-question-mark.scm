(define (contract-question-mark variable)
  (string->symbol
   (string-append "?" 
                  (if (number? (cadr variable))
                      (string-append (symbol->string (caddr variable))
                                     "-"
                                     (number->string (cadr variable)))
                      (symbol->string (cadr variable))))))

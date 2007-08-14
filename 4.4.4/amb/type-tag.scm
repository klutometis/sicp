(define (type-tag exp)
  (cond ((or (number? exp) (string? exp)) 'self-evaluating)
        ((symbol? exp) 'variable)
        ((pair? exp)
         (let ((tag (car exp)))
           (if (get-amb tag)
               tag
               'application)))
        (else (error "Unknown type -- TYPE-TAG" exp))))

               

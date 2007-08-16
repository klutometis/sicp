(define amb-qeval-simple-query
  '(define (amb-qeval-simple-query query data-base)
     (list (list 'lambda '()
         (list 'let
               (list (list 'assertion
                           (cons 'amb
                                 (amb-qeval-map
                                  (lambda (assertion) (list 'quote assertion))
                                  (data-base 'get-assertions)))))
               (list 'require (list 'amb-qeval-match?
                                    (list 'quote query)
                                    'assertion))
           'assertion)))))

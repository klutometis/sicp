(define (find-assertions pattern environment)
  (stream-flatmap (lambda (datum)
                    (check-an-assertion datum pattern environment))
                  (fetch-assertions pattern environment)))

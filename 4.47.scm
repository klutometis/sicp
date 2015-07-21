#!/usr/bin/env chicken-scheme

(use debug sicp sicp-eval sicp-eval-amb srfi-1 test)

(with-natural-language `()
  (lambda (env)
    (ambeval* '(define (parse-verb-phrase)
                 (amb (parse-word verbs)
                      (list
                       'verb-phrase
                       (parse-verb-phrase)
                       (parse-prepositional-phrase))))
              env)
    (test-assert
     "New parse-verb-phrase doesn't terminate"
     (not (terminates?
           (lambda () (ambeval* '(parse '(the student with the cat sleeps in the class)) env)))))))

(with-natural-language `()
  (lambda (env)
    (ambeval* '(define (parse-verb-phrase)
                 (amb (list
                       'verb-phrase 
                       (parse-verb-phrase)
                       (parse-prepositional-phrase))
                      (parse-word verbs)))
              env)
    (test-assert
     "Interchanging the order of expressions still doesn't terminate."
     (not (terminates?
           (lambda () (ambeval* '(parse '(the student with the cat sleeps in the class)) env)))))))

#!/usr/bin/env chicken-scheme
(use sicp-eval sicp-eval-amb test)

(with-natural-language `()
  (lambda (env)
    (ambeval* '(define conjunctions
                 '(conjunction for and nor but or yet so))
              env)
    (ambeval* '(define (parse-simple-sentence)
                 (list 'simple-sentence
                       (parse-noun-phrase)
                       (parse-verb-phrase)))
              env)
    (ambeval* '(define (parse-sentence)
                 (define (maybe-extend sentence)
                   (amb
                    sentence
                    (maybe-extend
                     (list 'compound-sentence
                           sentence
                           (parse-word conjunctions)
                           (parse-sentence)))))
                 (maybe-extend (parse-simple-sentence)))
              env)
    (test "Compound sentences"
          '((compound-sentence
             (compound-sentence
              (simple-sentence
               (simple-noun-phrase (article the) (noun cat))
               (verb sleeps))
              (conjunction and)
              (simple-sentence
               (simple-noun-phrase (article the) (noun student))
               (verb sleeps)))
             (conjunction but)
             (simple-sentence
              (simple-noun-phrase (article the) (noun professor))
              (verb lectures)))
            (compound-sentence
             (simple-sentence
              (simple-noun-phrase (article the) (noun cat))
              (verb sleeps))
             (conjunction and)
             (compound-sentence
              (simple-sentence
               (simple-noun-phrase (article the) (noun student))
               (verb sleeps))
              (conjunction but)
              (simple-sentence
               (simple-noun-phrase (article the) (noun professor))
               (verb lectures)))))
          (ambeval* '(parse '(the cat sleeps and
                                  the student sleeps but
                                  the professor lectures))
                    env))))

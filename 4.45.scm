#!/usr/bin/env chicken-scheme

(use bindings debug sicp-eval sicp-eval-amb test)

;;; TODO: Make env implicit, so that we don't have to pass it around?
;;; We could macroize, it, too; so that there's an implicit
;;; quasi-quote in the expressions passed in.
(with-require `((quote (lambda (x) (quote x)))
                (list ,list)
                (memq ,memq))
  (lambda (env)
    (ambeval* '(define nouns
                 '(noun student professor cat class))
              env)
    (ambeval* '(define verbs
                 '(verb studies lectures eats sleeps))
              env)
    (ambeval* '(define articles
                 '(article the a))
              env)
    (ambeval* '(define prepositions
                 '(prep for to in by with))
              env)
    (ambeval* '(define (parse-sentence)
                 (list 'sentence
                       (parse-noun-phrase)
                       (parse-verb-phrase)))
              env)
    (ambeval* '(define (parse-prepositional-phrase)
                 (list 'prep-phrase
                       (parse-word prepositions)
                       (parse-noun-phrase)))
              env)
    (ambeval* '(define (parse-verb-phrase)
                 (define (maybe-extend verb-phrase)
                   (amb
                    verb-phrase
                    (maybe-extend
                     (list 'verb-phrase
                           verb-phrase
                           (parse-prepositional-phrase)))))
                 (maybe-extend (parse-word verbs)))
              env)
    (ambeval* '(define (parse-simple-noun-phrase)
                 (list 'simple-noun-phrase
                       (parse-word articles)
                       (parse-word nouns)))
              env)
    (ambeval* '(define (parse-noun-phrase)
                 (define (maybe-extend noun-phrase)
                   (amb
                    noun-phrase
                    (maybe-extend
                     (list 'noun-phrase
                           noun-phrase
                           (parse-prepositional-phrase)))))
                 (maybe-extend (parse-simple-noun-phrase)))
              env)
    (ambeval* '(define (parse-word word-list)
                 (require (not (null? *unparsed*)))
                 (require (memq (car *unparsed*)
                                (cdr word-list)))
                 (let ((found-word (car *unparsed*)))
                   (set! *unparsed* (cdr *unparsed*))
                   (list (car word-list) found-word)))
              env)
    (ambeval* '(define *unparsed* '()) env)
    (ambeval* '(define (parse input)
                 (set! *unparsed* input)
                 (let ((sent (parse-sentence)))
                   (require (null? *unparsed*))
                   sent))
              env)
    (bind (parse-1 parse-2 parse-3 parse-4 parse-5)
          (ambeval*
           '(parse '(the professor lectures to the student in the class with the cat))
           env)
          (test "(The professor) (((lectures to the student) in the class) with the cat)."
                parse-1
                '(sentence
                  (simple-noun-phrase (article the) (noun professor))
                  (verb-phrase
                   (verb-phrase
                    (verb-phrase
                     (verb lectures)
                     (prep-phrase
                      (prep to)
                      (simple-noun-phrase (article the) (noun student))))
                    (prep-phrase
                     (prep in)
                     (simple-noun-phrase (article the) (noun class))))
                   (prep-phrase
                    (prep with)
                    (simple-noun-phrase (article the) (noun cat))))))
          (test "(The professor) ((lectures to the student) (in the class (with the cat)))."
                parse-2
                '(sentence
                  (simple-noun-phrase (article the) (noun professor))
                  (verb-phrase
                   (verb-phrase
                    (verb lectures)
                    (prep-phrase
                     (prep to)
                     (simple-noun-phrase (article the) (noun student))))
                   (prep-phrase
                    (prep in)
                    (noun-phrase
                     (simple-noun-phrase (article the) (noun class))
                     (prep-phrase
                      (prep with)
                      (simple-noun-phrase (article the) (noun cat))))))))
          (test "(The professor) ((lectures (to the student in the class)) with the cat)."
                parse-3
                '(sentence
                  (simple-noun-phrase (article the) (noun professor))
                  (verb-phrase
                   (verb-phrase
                    (verb lectures)
                    (prep-phrase
                     (prep to)
                     (noun-phrase
                      (simple-noun-phrase (article the) (noun student))
                      (prep-phrase
                       (prep in)
                       (simple-noun-phrase (article the) (noun class))))))
                   (prep-phrase
                    (prep with)
                    (simple-noun-phrase (article the) (noun cat))))))
          (test
           "(The professor) (lectures (to ((the student in the class) with the cat))."
           parse-4
           '(sentence
             (simple-noun-phrase (article the) (noun professor))
             (verb-phrase
              (verb lectures)
              (prep-phrase
               (prep to)
               (noun-phrase
                (noun-phrase
                 (simple-noun-phrase (article the) (noun student))
                 (prep-phrase
                  (prep in)
                  (simple-noun-phrase (article the) (noun class))))
                (prep-phrase
                 (prep with)
                 (simple-noun-phrase (article the) (noun cat))))))))
          (test
           "(The professor) (lectures (to the student (in the class (with the cat)))."
           parse-5
           '(sentence
             (simple-noun-phrase (article the) (noun professor))
             (verb-phrase
              (verb lectures)
              (prep-phrase
               (prep to)
               (noun-phrase
                (simple-noun-phrase (article the) (noun student))
                (prep-phrase
                 (prep in)
                 (noun-phrase
                  (simple-noun-phrase (article the) (noun class))
                  (prep-phrase
                   (prep with)
                   (simple-noun-phrase (article the) (noun cat)))))))))))
    ;; (pp (ambeval* '(parse '(the professor lectures to the student in the class with the cat)) env))
    ))

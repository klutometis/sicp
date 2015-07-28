#!/usr/bin/env chicken-scheme

(use sicp-eval sicp-eval-amb test)

(with-natural-language `()
  (lambda (env)
    (ambeval* `(define (parse-word word-list)
                 (list (car word-list) (an-element-of (cdr word-list))))
              env)
    (test
     "Generating sentences"
     '((sentence (simple-noun-phrase (article the) (noun student)) (verb studies))
       (sentence
        (simple-noun-phrase (article the) (noun student))
        (verb-phrase
         (verb studies)
         (prep-phrase
          (prep for)
          (simple-noun-phrase (article the) (noun student)))))
       (sentence
        (simple-noun-phrase (article the) (noun student))
        (verb-phrase
         (verb-phrase
          (verb studies)
          (prep-phrase
           (prep for)
           (simple-noun-phrase (article the) (noun student))))
         (prep-phrase
          (prep for)
          (simple-noun-phrase (article the) (noun student)))))
       (sentence
        (simple-noun-phrase (article the) (noun student))
        (verb-phrase
         (verb-phrase
          (verb-phrase
           (verb studies)
           (prep-phrase
            (prep for)
            (simple-noun-phrase (article the) (noun student))))
          (prep-phrase
           (prep for)
           (simple-noun-phrase (article the) (noun student))))
         (prep-phrase
          (prep for)
          (simple-noun-phrase (article the) (noun student)))))
       (sentence
        (simple-noun-phrase (article the) (noun student))
        (verb-phrase
         (verb-phrase
          (verb-phrase
           (verb-phrase
            (verb studies)
            (prep-phrase
             (prep for)
             (simple-noun-phrase (article the) (noun student))))
           (prep-phrase
            (prep for)
            (simple-noun-phrase (article the) (noun student))))
          (prep-phrase
           (prep for)
           (simple-noun-phrase (article the) (noun student))))
         (prep-phrase
          (prep for)
          (simple-noun-phrase (article the) (noun student)))))
       (sentence
        (simple-noun-phrase (article the) (noun student))
        (verb-phrase
         (verb-phrase
          (verb-phrase
           (verb-phrase
            (verb-phrase
             (verb studies)
             (prep-phrase
              (prep for)
              (simple-noun-phrase (article the) (noun student))))
            (prep-phrase
             (prep for)
             (simple-noun-phrase (article the) (noun student))))
           (prep-phrase
            (prep for)
            (simple-noun-phrase (article the) (noun student))))
          (prep-phrase
           (prep for)
           (simple-noun-phrase (article the) (noun student))))
         (prep-phrase
          (prep for)
          (simple-noun-phrase (article the) (noun student))))))
     (ambeval* '(parse '()) env 6))))

#!/usr/bin/env chicken-scheme
(use bindings debug sicp-eval sicp-eval-amb test)

;;; TODO: Make env implicit, so that we don't have to pass it around?
;;; We could macroize, it, too; so that there's an implicit
;;; quasi-quote in the expressions passed in.
(with-natural-language `()
  (lambda (env)
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
           "(The professor) (lectures (to ((the student (in the class)) with the cat))."
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

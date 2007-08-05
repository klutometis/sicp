(load-option 'format)

(load "test.scm")
(load "install-packages.scm")
(load "ambeval-global.scm")
(load "ambeval-global-until-fail")
(load "require.scm")
(load "natural-language.scm")
(load "install-reverse-amb-package.scm")
(load "try-kill.scm")

(install-packages)
(ambeval-global require)
(map ambeval-global natural-language)

(define redefinitions
  (list
   '(define (parse-verb-phrase)
      (amb (parse-word verbs)
           (list 'verb-phrase
                 (parse-verb-phrase)
                 (parse-prepositional-phrase))))
   '(define (parse-noun-phrase)
      (amb (parse-word nouns)
           (list 'noun-phrase
                 (parse-noun-phrase)
                 (parse-prepositional-phrase))))
   ))

(map ambeval-global redefinitions)

(try-kill (lambda () (ambeval-global '(parse '(the cat eats))))
          "normal-order amb never returns"
          1000)

;; Doesn't work, even if reverse the order of amb.
(install-reverse-amb-package)
(try-kill (lambda () (ambeval-global '(parse '(the cat eats))))
          "reverse-order amb never returns"
          1000)

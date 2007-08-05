(load "test.scm")
(load "install-packages.scm")
(load "ambeval-global.scm")
(load "ambeval-global-until-fail.scm")
(load "require.scm")
(load "natural-language.scm")

(install-packages)
(ambeval-global require)
(map ambeval-global natural-language)

(define quinquies-ambiguus
  (ambeval-global-until-fail
   '(parse
     '(the professor lectures to the student in the class with the cat))))

(test
 "five-fold-ambiguous sentence"
 '((sentence (simple-noun-phrase (article the) (noun professor)) (verb-phrase (verb-phrase (verb-phrase (verb lectures) (prep-phrase (prep to) (simple-noun-phrase (article the) (noun student)))) (prep-phrase (prep in) (simple-noun-phrase (article the) (noun class)))) (prep-phrase (prep with) (simple-noun-phrase (article the) (noun cat)))))
   (sentence (simple-noun-phrase (article the) (noun professor)) (verb-phrase (verb-phrase (verb lectures) (prep-phrase (prep to) (simple-noun-phrase (article the) (noun student)))) (prep-phrase (prep in) (noun-phrase (simple-noun-phrase (article the) (noun class)) (prep-phrase (prep with) (simple-noun-phrase (article the) (noun cat)))))))
   (sentence (simple-noun-phrase (article the) (noun professor)) (verb-phrase (verb-phrase (verb lectures) (prep-phrase (prep to) (noun-phrase (simple-noun-phrase (article the) (noun student)) (prep-phrase (prep in) (simple-noun-phrase (article the) (noun class)))))) (prep-phrase (prep with) (simple-noun-phrase (article the) (noun cat)))))
   (sentence (simple-noun-phrase (article the) (noun professor)) (verb-phrase (verb lectures) (prep-phrase (prep to) (noun-phrase (noun-phrase (simple-noun-phrase (article the) (noun student)) (prep-phrase (prep in) (simple-noun-phrase (article the) (noun class)))) (prep-phrase (prep with) (simple-noun-phrase (article the) (noun cat)))))))
   (sentence (simple-noun-phrase (article the) (noun professor)) (verb-phrase (verb lectures) (prep-phrase (prep to) (noun-phrase (simple-noun-phrase (article the) (noun student)) (prep-phrase (prep in) (noun-phrase (simple-noun-phrase (article the) (noun class)) (prep-phrase (prep with) (simple-noun-phrase (article the) (noun cat))))))))))
 quinquies-ambiguus
 'equal? equal?)

;; If we distinguish verb-phrases with (), and noun- with [], the
;; structure becomes:
;;
;; (((lecture student) class) cat)

;; He lectures the student; the lecturing takes place in the class;
;; the lecturing in the class takes place with the cat.

;; ((lecture student) class cat)

;; He lectures the student; the lecturing takes place in the class
;; with the cat.

;; ((lecture student class) cat)

;; He lectures the student in the class; the lecturing takes place
;; with the cat.

;; (lecture [[student class] cat])

;; He lectures the student who is in the class; the student is with
;; the cat.

;; (lecture [student [class cat]])

;; He lectures the student; the student is in the class which is with
;; the cat.

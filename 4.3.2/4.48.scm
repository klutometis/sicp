(load "test.scm")
(load "install-packages.scm")
(load "ambeval-global.scm")
(load "require.scm")
(load "natural-language.scm")

(install-packages)
(ambeval-global require)
(map ambeval-global natural-language)

(define compound-sentence (ambeval-global '(parse '(the cat eats and the student eats))))

(test
 "compound sentences"
 '(compound-sentence (simple-sentence (simple-noun-phrase (article the) (noun cat)) (verb eats)) (conjunction (conjunction and) (simple-sentence (simple-noun-phrase (article the) (noun student)) (verb eats))))
 compound-sentence
 'equal? equal?)

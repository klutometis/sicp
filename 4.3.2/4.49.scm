(load "test.scm")
(load "install-packages.scm")
(load "ambeval-global.scm")
(load "ambeval-global-n.scm")
(load "require.scm")
(load "natural-language.scm")
(load "parse-word-generate.scm")
(load "an-element-of.scm")

(install-packages)
(ambeval-global require)
(ambeval-global an-element-of)
(map ambeval-global natural-language)
(ambeval-global parse-word-generate)

(define generated-sentences (ambeval-global-n '(parse '(the cat eats)) 6))

(test
 "sentence generation with template (predictable)"
 '((simple-sentence (simple-noun-phrase (article the) (noun student)) (verb studies)) (simple-sentence (simple-noun-phrase (article the) (noun student)) (verb lectures)) (simple-sentence (simple-noun-phrase (article the) (noun student)) (verb eats)) (simple-sentence (simple-noun-phrase (article the) (noun student)) (verb sleeps)) (simple-sentence (simple-noun-phrase (article the) (noun professor)) (verb studies)) (simple-sentence (simple-noun-phrase (article the) (noun professor)) (verb lectures)))
 generated-sentences
 'equal? equal?)

(load "test.scm")
(load "match?.scm")
(load "install-packages.scm")
(load "ambeval-global.scm")
(load "ambeval-global-n.scm")
(load "require.scm")
(load "natural-language.scm")
(load "parse-word-generate.scm")
(load "an-element-of.scm")
(load "install-ramb-package.scm")

(install-packages)
;; Drop-in random replacement for amb
(install-ramb-package)
(ambeval-global require)
(ambeval-global an-element-of)
(map ambeval-global natural-language)
(ambeval-global parse-word-generate)

(define n-sentences 6)
(define first-generated-sentences (ambeval-global-n '(parse '(the cat eats)) n-sentences))
(define second-generated-sentences (ambeval-global-n '(parse '(the cat eats)) n-sentences))

(define pattern "(simple-sentence (simple-noun-phrase (article .*) (noun .*)) (verb .*))")

(test
 "generated sentences are valid"
 pattern
 (append first-generated-sentences second-generated-sentences)
 'match?
 (lambda (pattern sentences)
   (fold-right (lambda (sentence matcheth?)
                 (and matcheth? (match? pattern sentence)))
               #t
               sentences)))
 
(test
 "generated sentences are non-identical (may fail from time to time)"
 first-generated-sentences
 second-generated-sentences
 '(not (equal?))
 (lambda (first second) (not (equal? first second))))

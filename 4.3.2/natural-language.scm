;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "nouns.scm")
(load "verbs.scm")
(load "articles.scm")
(load "parse-word.scm")
(load "*unparsed*.scm")
(load "parse.scm")
(load "prepositions.scm")
(load "parse-prepositional-phrase.scm")
(load "parse-sentence.scm")
(load "parse-verb-phrase.scm")
(load "parse-simple-noun-phrase.scm")
(load "parse-noun-phrase.scm")
(load "parse-compound-sentence.scm")
(load "parse-simple-sentence.scm")
(load "conjunctions.scm")
(load "parse-conjunction.scm")


(define natural-language
  (list nouns
        verbs
        articles
        parse-word
        *unparsed*
        parse
        prepositions
        conjunctions
        parse-prepositional-phrase
        parse-sentence
        parse-verb-phrase
        parse-simple-noun-phrase
        parse-noun-phrase
        parse-conjunction
        parse-compound-sentence
        parse-simple-sentence
        ))
